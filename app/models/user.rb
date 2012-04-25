class User < ActiveRecord::Base
  has_many :user_tokens
  has_one :identity

  def email
    return identity.email if self.identity
    user_tokens.first.email if user_tokens.count > 0
  end

  def self.from_omniauth(auth)

    user_auth = if(auth["provider"] == "identity")
                  Identity.find_by_email(auth["info"]["email"])
                else
                  UserToken.find_by_provider_and_uid(auth["provider"], auth["uid"])
                end

    if user_auth.try(:user)
      user_auth.user
    else
      user = find_anywhere_by_email(auth["info"]["email"]) || create_with_omniauth(auth)

      if (auth["provider"] == "identity")
        id =Identity.find_by_email(auth["info"]["email"])
        id.user_id = user.id
        id.save
      else
        UserToken.create(:provider => auth[:provider], :uid => auth["uid"], :user_id => user.id, :email => auth["info"]["email"])
      end
      user
    end

  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name, user.last_name = auth["info"]["name"].split(" ")

      if auth["provider"] != "identity"
        #TODO add dob and gender
        # user.dob = ...
        # user.gender = ...
      end
    end
  end

  def self.find_anywhere_by_email(email)
    user = UserToken.find_by_email(email).try(:user) || Identity.find_by_email(email).try(:user)
  end

end

