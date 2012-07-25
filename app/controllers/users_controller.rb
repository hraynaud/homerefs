class UsersController < ApplicationController

  def show
    @reviews = current_user.reviews

  end
  def create

    email = params[:email] || session["omniauth"]["info"]["email"]
    @user = User.find_anywhere_by_email(email)

    if @user.nil?
      @user= User.new
      @user.dob = Date.new(params["date"]["year"].to_i, 1, 1) if params["date"]["year"].present?
      @user.gender = params["gender"] if params["gender"].present?
      @user.name = params["name"] if params["name"].present?
      if @user.valid?
        @user.save
      end

      if session["omniauth"] # Original login from fb
        @user.name = session["omniauth"]["info"]["name"]
        UserToken.create(:provider => session["omniauth"]["provider"], :uid => session["omniauth"]["uid"], :email => session["omniauth"]["info"]["email"], :user_id => @user.id )
      end
    end

    unless session["omniauth"]
      id = Identity.find_by_email(params[:email])
      if id.nil?
        @identity = Identity.new(:name => params["name"],:password=>params["password"],:password_confirmation=>params["password_confirmation"],:email=>params["email"])
          @identity.user_id = @user.id
        if @identity.valid?
          @identity.save
        else
          render new_identity_path
          return
        end
      else
        flash.now[:error] = "Idenity already exists"
        render new_identity_path
        return
      end
    end
    session[:user_id] = @user.id
    session["omniauth"] = nil
    redirect_to session["user_return_to"]
  end
end
