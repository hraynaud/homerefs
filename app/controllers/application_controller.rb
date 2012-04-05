class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_current_user
  helper_method :user_logged_in?

  def get_current_user
    begin
      @current_user = User.find(session[:user_id]) if session[:session_id].present?
    rescue
      reset_session
    end
  end

  def user_logged_in?
    @current_user.present?
  end

end
