class TransactionsController < ApplicationController
  before_action :is_authenticated

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction, notice: 'Thank you for booking with us.'
    else
      render :new
    end
  end

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

  def transaction_params
    params.require(:transaction).permit(:fammember, :caregiver, :patient, :start_date)
  end
end
