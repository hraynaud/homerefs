class SessionsController < ApplicationController

  def new

  end

  def create
    uid = env["omniauth.auth"]["uid"]
    provider = env["omniauth.auth"]["provider"]
    token = UserToken.find_by_provider_and_uid(provider, uid) || Identity.find_by_email(params[:auth_key])

    if token
      session[:user_id] = token.user.id
      return_path = session["user_return_to"] || root_url
      redirect_to return_path, notice: "Signed in!"
    else
      @user = (params[:user].present? && session["omniauth"].present?) ? User.create(params[:user]) : User.from_omniauth(env["omniauth.auth"])
      if @user.valid?
        session[:user_id] = @user.id
        return_path = session["user_return_to"] || root_url
        redirect_to return_path, notice: "Signed in!"
      else
        session["omniauth"] = env["omniauth.auth"]
        redirect_to new_user_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to login_path, alert: "Authentication failed, please try again."
  end

end
