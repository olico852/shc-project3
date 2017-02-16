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
    if @transaction.save
      puts '::::::::'
      puts @caregiveremail.inspect
      puts ":::::::"
      puts @caregiver.inspect

      UserMailer.fammember_transaction_email(current_user).deliver
      UserMailer.caregiver_transaction_email(@caregiveremail).deliver
      redirect_to root_path, notice: 'Thank you for booking with us.'
    else
      render :new
    end
  end

  def edit
      puts "::::"*50
      puts @transaction.inspect
  end

  def update
    @transaction = Transaction.find(params[:id]).update(transaction_params)
    @transaction2 = Transaction.find(params[:id]).update(pending: false)
    puts "::::"*50
    p transaction_params.inspect
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
    p 'show yourself'*20
    p @transaction
  end

  def set_caregiver
    @caregiver = Caregiver.find_by(id: params[:caregiver_id])
  end

  def set_caregiver_email
    @caregiveremail = User.find_by(id: @caregiver.user_id)
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :approved)
  end
end
