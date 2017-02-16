class FammembersController < ApplicationController
  before_action :set_fammember, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, only: [:update, :destroy, :edit, :show ]
  before_action :is_authenticated_fammember, only: [:update, :destroy, :edit, :show ]


  def index

  end

  def show

    @review = Review.where(user_id: @user.id)
    @fammember = Fammember.find_by(user_id: params[:id])
    @patient = Patient.where(fammember_id: @fammember.id)
    # p '*' * 100
    # p @transaction_caregiver = Transaction.find_by(user_id: current_user.id).caregiver_id
    # p @caregivers = Caregiver.find_by(id: @transaction_caregiver).user_id
    # p @caregivers_name = User.find_by(id: @caregivers).first_name
    # p '*' * 100
  end

  def new
    @user = User.new
    @fammember = Fammember.new
  end

  def create
    @user = User.new(fammember_params)
      if @user.save
        # UserMailer.welcome_email(@user).deliver
        @fammember = Fammember.new
        @fammember.user_id = @user.id
        if @fammember.save
          flash[:success] = "Your profile has been sucessfully created"
          redirect_to login_path
        end
      else
        flash[:failure] = "Error..."
        redirect_to :back
    end
  end

  def edit
  end

  def update
    @user = User.update(fammember_params)
    redirect_to fammember_path
  end

  def destroy
    @user.destroy
    flash[:success] = "account has been successfully deleted."
    redirect_to '/'
  end

  private

  def set_fammember
    @user = User.find(params[:id])
  end

  def fammember_params
    params.require(:fammembers).permit(:first_name, :last_name, :contact, :email, :password, :usertype)
  end
end
