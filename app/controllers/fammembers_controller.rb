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
    puts '*'*50
    puts @patient.inspect
    puts '*'*50
    # @patient = Patient.find_by(user_id: params[:id])
    #
    # p '*' * 50
    # p @patient
    # p '*' * 50
    # @review = User.find_by(user_id: params[:fammember_id])
  end

  def new
    @user = User.new
    @fammember = Fammember.new
  end

  def create
    @user = User.new(fammember_params)
      if @user.save
        UserMailer.welcome_email(@user).deliver
        @fammember = Fammember.new
        @fammember.user_id = @user.id
        if @fammember.save
          redirect_to login_path, notice: "Your profile has been sucessfully created, please log in."
        end
      else
        redirect_to :back, notice: "Error..."
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
    # @fammember = Fammember.destroy
    redirect_to '/', notice: "Your profile was successfully destroyed"
  end

  private

  def set_fammember
    @user = User.find(params[:id])
    # @fammember = Fammember.find(user_id: params[:id])
  end

  def fammember_params
    params.require(:fammembers).permit(:first_name, :last_name, :contact, :email, :password, :usertype)
  end
end
