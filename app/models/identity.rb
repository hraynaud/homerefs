class Identity < OmniAuth::Identity::Models::ActiveRecord
  belongs_to :user
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :user_id, :presence => true


end

