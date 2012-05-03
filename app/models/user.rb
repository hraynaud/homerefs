class User < ActiveRecord::Base
  has_many :user_tokens
  has_one :identity
  has_many :reviews
  validates :gender, :dob, :presence => true

  def email
    return identity.email if self.identity
    user_tokens.first.email if user_tokens.count > 0
  end

  def self.from_omniauth(auth)
    user_auth = self.auth_type_by_provider(auth)
    if user_auth.try(:user) #This should now always be true
      user_auth.user
    elsif  auth["provider"] == "facebook"
      user =  self.create_with_omniauth(auth)
      if user.valid?
        UserToken.create(:provider => auth[:provider], :uid => auth["uid"], :user_id => user.id, :email => auth["info"]["email"])
      end
        user
    else
      nil #Should never get here
    end
  end

def age
  now = Time.now.utc.to_date
  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
end



  def self.create_with_omniauth(auth)
    create do |user|
      user.first_name, user.last_name = auth["info"]["name"].split(" ") if auth["info"]["name"].present?
      if (auth["extra"]["raw_info"]["birthday"]).present? && (auth["extra"]["raw_info"]["gender"]).present?
        user.dob = Date.strptime(auth["extra"]["raw_info"]["birthday"], '%m/%d/%Y')
        user.gender = (auth["extra"]["raw_info"]["gender"]).first
        user
      else
        user.errors.add(:dob, "Birth Year Required")
        user.errors.add(:gender, "Gender Required")
      end
    end
  end

  def self.find_anywhere_by_email(email)
    user = UserToken.find_by_email(email).try(:user) || Identity.find_by_email(email).try(:user)
  end

  def self.auth_type_by_provider(auth)
    if(auth["provider"] == "identity")
      Identity.find_by_email(auth["info"]["email"])
    else
      UserToken.find_by_provider_and_uid(auth["provider"], auth["uid"])
    end
  end
end

