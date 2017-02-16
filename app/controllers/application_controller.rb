class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_authenticated
    unless current_user
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def is_authenticated_caregiver
    unless current_user.usertype == 'Caregiver'
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def is_authenticated_fammember
    unless current_user.usertype == 'Fammember'
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def current_user  #this is tagged to the session
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
end
