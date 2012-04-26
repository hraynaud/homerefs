class UsersController < ApplicationController

  def create
    user = User.find_anywhere_by_email(params[:email])
    if user.nil?
      user= User.new

      user.dob = Date.new(params["date"]["year"].to_i, 1, 1) if params["date"]["year"].present?
      user.gender = params["gender"] if params["gender"].present?
      user.name = params["name"] if params["name"].present?
      user.save
    end

    id = Identity.find_by_email(params[:email])
    if id.nil?
      id = Identity.new(:password=>params["password"],:password_confirmation=>params["password_confirmation"],:email=>params["email"])
      if id.valid?
        id.user_id = user.id
        id.save
        session[:user_id]=user.id
        redirect_to session[:user_return_to]
        return
      end
    else

      flash.now[:error] = "Idenity already exists"
      render new_identity_path
    end
  end
end
