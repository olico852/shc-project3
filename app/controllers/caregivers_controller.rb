class CaregiversController < ApplicationController
  before_action :set_caregiver, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @user = User.new
    @caregiver = Caregiver.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        @caregiver = Caregiver.new(caregiver_params)
        @caregiver.user_id = @user.id
      if @caregiver.save
          redirect_to login_path, notice: "Your profile has been sucessfully created"
      else
        redirect_to :back, notice: "Error..."
      end
    end
  end

  def edit
  end

  def update
    @user = User.update(user_params)
    @caregiver = Caregiver.update(caregiver_params)
    redirect_to caregiver_path
  end

  def destroy
    @caregiver.destroy
    redirect_to '/', notice: "Your account has been successfully deleted."
  end

  private

  def set_caregiver
    @user = User.find(params[:id])
    # @caregiver = Caregiver.find(params[:id])
  end

  def user_params
    params.require(:details).permit(:first_name, :last_name, :email, :password, :contact, :usertype)
  end

  def caregiver_params
    params.require(:details).permit(:gender, :certification, :languages, :specialties, :yearsofexperience, :experiencedescription, :photo)
  end
end
