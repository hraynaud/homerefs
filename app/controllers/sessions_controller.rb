class SessionsController < ApplicationController

  def create
    user_email = request.env['omniauth.auth']['info']['email'].strip.downcase
    user = User.find_or_create_by_email(user_email)
    user.facebook_authentication_token = request.env['omniauth.auth']['credentials']['token']
    user.facebook_authentication_secret = request.env['omniauth.auth']['credentials']['secret']
    user.first_name = request.env['omniauth.auth']['info']['first_name']
    user.last_name = request.env['omniauth.auth']['info']['last_name']
    user.name = request.env['omniauth.auth']['info']['name']
    user.facebook_image_url = request.env['omniauth.auth']['info']['image_url']
    user.location = request.env['omniauth.auth']['info']['location']
    user.save!
    session[:user_id] = user.id
    redirect_to home_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end


# Check out request.env['omniauth.auth']['info']:
# #<OmniAuth::AuthHash::InfoHash email="peter@pbell.com" first_name="Peter" image="http://graph.facebook.com/554138408/picture?type=square" last_name="Bell" location="New York, New York" name="Peter Bell" nickname="pbellnyc" urls=#<Hashie::Mash Facebook="http://www.facebook.com/pbellnyc">>

  def callback
    auth # Do what you want with the auth hash!
  end

  def auth; request.env['omniauth.auth'] end
end
