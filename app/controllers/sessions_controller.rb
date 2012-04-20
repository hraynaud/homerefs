class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    return_path = session["user_return_to"] || root_url
    redirect_to return_path, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to login_path, alert: "Authentication failed, please try again."
  end

end
