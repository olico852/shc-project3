class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_caregiver, only: [:show, :new, :create]

  before_action :set_caregiver_email, only: [:show, :new, :create]
  before_action :is_authenticated, only: :new
  before_action :is_authenticated_fammember, only: :new

  def index
    if current_user.usertype === "Fammember"
      @transactions = Transaction.all
    end
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.caregiver_id = @caregiver.id
    @patients = Patient.where(fammember_id: Fammember.find_by(user_id: current_user.id))
    if @transaction.save
      UserMailer.fammember_transaction_email(current_user).deliver
      UserMailer.caregiver_transaction_email(@caregiveremail).deliver
      redirect_to root_path, notice: 'Thank you for booking with us.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @transaction = Transaction.find(params[:id]).update(transaction_params)
    @transaction2 = Transaction.find(params[:id]).update(pending: false)
    if transaction_params['approved'] == false
      @transaction3 = Transaction.find(params[:id]).update(cancelled: true)  #got error. not working.
    end

    redirect_to caregiver_path(current_user)

  end

  def destroy
    @transaction.destroy
    redirect_to fammember_path, notice: 'Your transaction has been successfully destroyed.'
  end

private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_caregiver
    @caregiver = Caregiver.find_by(id: params[:caregiver_id])
  end

  def set_caregiver_email
    @caregiveremail = User.find_by(id: @caregiver.user_id)
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :approved, :patient_id)
  end
end
