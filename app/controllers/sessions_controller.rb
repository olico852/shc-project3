class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_and_authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "User logged in!!"
      redirect_to login_path
    else
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil  #clear the session id
    flash[:success] = "User logged out!!"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
