class CaregiversController < ApplicationController
  before_action :set_caregiver, only: [:show, :edit, :update, :destroy]

  def index
    # @caregivers = Caregiver.search(params[:search])
    @caregivers = Caregiver.all
  end

  def search
    @caregivers = Caregiver.search(params[:search])
  end

  def show
      if current_user.usertype === "Caregiver"
       @caregiver = Caregiver.find_by(user_id: params[:id])
     elsif current_user.usertype === "Fammember"
       @caregiver = Caregiver.find_by(id: params[:id])
    end
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

            upload

      if @caregiver.save
        redirect_to login_path, notice: "Your profile has been sucessfully created"
      else
        @user.destroy if @user.save
        redirect_to :back, notice: "Error..."
      end
    end
  end

  def edit
  end

  def update
    upload
    @user = User.update(user_params)
    @caregiver = Caregiver.update(caregiver_params)
    redirect_to caregiver_path
  end

  def destroy
    # Cloudinary::Api.delete_resources(Caregiver.user_id(params[@user.id]).photo])
    @user.destroy
    redirect_to '/', notice: "Your account has been successfully deleted."
  end

  private

  def upload
   if params[:details][:photo].present?
     if @caregiver.valid?
       uploaded_file = params[:details][:photo].path
       cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
       @caregiver.photo = cloudinary_file['public_id']
     end
     params[:details].delete :photo
   end
end

  def set_caregiver
    @user = User.find(params[:id])

  end

  def user_params
    params.require(:details).permit(:first_name, :last_name, :email, :password, :contact, :usertype)
  end

  def caregiver_params
    params.require(:details).permit(:gender, :certification, :yearsofexperience, :experiencedescription, :photo, :language_ids => [], :specialty_ids => [])
  end
end
