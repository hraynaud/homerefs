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

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end


  private

  def render_404(exception)
    @not_found_path = exception.message
    logger.fatal "!!! FATAL_ERROR: #{exception.message}"
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    @error = exception
    logger.fatal "!!! FATAL_ERROR: #{@error.message}"
    respond_to do |format|
      format.html { render template: 'errors/error_500', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end

  def get_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :get_current_user

end
