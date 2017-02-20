class CaregiversController < ApplicationController
  before_action :set_caregiver, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, only: [:search, :update, :delete, :edit, :show ]

  def index
    @caregivers = Caregiver.all
  end

  def search
    @caregivers = Caregiver.search(params[:search])
  end

  def show
      if current_user.usertype === "Caregiver"
      #  @caregiver = Caregiver.find_by(user_id: params[:id])
      #  @review = Review.where(user_id: current_user.id)
      #  p '*' * 100
      # #  p Transaction.
      # #  p @transaction_caregiver = Transaction.find_by(user_id: current_user.id).caregiver_id
      # #  p @caregivers = Caregiver.find_by(id: @transaction_caregiver).user_id
      # #  p @caregivers_name = User.find_by(id: @caregivers).first_name

        p "T" *100
        p params
       @caregiver = Caregiver.find_by!(user_id: params[:id])
       @review = Review.where(user_id: current_user.id)
       p '*' * 100
      @transaction = Transaction.where(caregiver_id: @caregiver.id)
      p @transaction
      #  @caregivers = Caregiver.find_by!(id: @transaction)
      #  @caregivers_name = User.find_by!(id: @caregivers)

       p '*' * 100
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
        flash[:success] = "Your profile has been sucessfully created"
        redirect_to login_path
      else
        @user.destroy if @user.save
        flash[:failure] = "Error..."
        redirect_to :back
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
    flash[:success] = "account has been successfully deleted."
    redirect_to '/'
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
