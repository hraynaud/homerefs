class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_logged_in?


  def user_logged_in?
    @current_user.present?
  end


  def authenticate_user
     redirect_to login_path unless get_current_user
  end
private

  def get_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :get_current_user

end
