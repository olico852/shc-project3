class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_and_authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "User logged in"
      puts "usertype is :::: #{user.usertype}"
      if user.usertype == 'Caregiver'
        redirect_to caregiver_path(user.id)
      if user.usertype == 'Fammember'
        redirect_to fammember_path(user.id)
      else
        flash[:danger] = 'Role dispute. Please check your log in credentials.'
        redirect_to '/'
      end
    else
      flash[:danger] = "Credentials Invalid!!"
      puts 'unsuccessful log in'
      redirect_to login_path
    end
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
