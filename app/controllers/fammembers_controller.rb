class FammembersController < ApplicationController
  before_action :set_fammember, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @fammember = Fammember.new
  end

  def create
    @fammember = Fammember.new(fammember_params)
    if
      @fammember.save
      fammember = Caregiver.find(@fammember)
      user = User.new
      user.usertypes = fammember
      user.save
      redirect_to @fammember, notice: "Your profile has been sucessfully created"
    else
      render :new
    end
  end

  def edit
    #renders the edit form
  end

  def update
    @fammember = Fammember.update(fammember_params)
  end

  def destroy
    @fammember = Fammember.destroy
    redirect_to fammembers_url, notice: "Your profile was successfully destroyed"
  end

  private

  def set_fammember
    @fammember = Fammember.find(params[:id])
  end

  def fammember_params
    params.require(:fammember).permit(:first_name, :last_name, :contact, :email)
  end
end
