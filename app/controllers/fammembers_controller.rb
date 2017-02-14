class FammembersController < ApplicationController
  before_action :set_fammember, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @user = User.new
    @fammember = Fammember.new
  end

  def create
    @user = User.new(fammember_params)
      if @user.save
        @fammember = Fammember.new
        @fammember.user_id = @user.id
      if @fammember.save
          redirect_to login_path, notice: "Your profile has been sucessfully created, please log in."
      else
        redirect_to :back, notice: "Error..."
      end
    end
  end

  def edit
    #renders the edit form
  end

  def update
    @user = User.update(fammember_params)
  end

  def destroy
    @fammember.destroy
    # @fammember = Fammember.destroy
    redirect_to '/', notice: "Your profile was successfully destroyed"
  end

  private

  def set_fammember
    @user = Fammember.find(params[:user_id])
    @fammember = Fammember.find(params[:id])
  end

  def fammember_params
    params.require(:fammember).permit(:first_name, :last_name, :contact, :email, :password, :usertype)
  end
end
