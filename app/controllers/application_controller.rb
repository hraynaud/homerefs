class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_logged_in?, :get_current_user


  def user_logged_in?
    !get_current_user.nil?
  end


  def authenticate_user
    if !user_logged_in?
      store_location
      redirect_to login_path
    end
  end

  def store_location
    session["user_return_to"] = request.url
  end

  private

  def get_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :get_current_user

end
