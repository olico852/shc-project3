class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_caregiver, only: [:show, :new, :create]
  

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
      redirect_to root_path, notice: 'Thank you for booking with us.'
    else
      render :new
    end
  end

  # transaction = Transaction.create!(user_id: 3, caregiver_id: 6, pending: true, approved: false, concluded: false, start_date: '2012-12-12', cancelled: false)


  def edit
  end

  def update
    @transaction = Transaction.update(transaction_params)
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

  def transaction_params
    params.require(:transactions).permit(:start_date)
  end
end
