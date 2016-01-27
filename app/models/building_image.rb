class BuildingImage < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  belongs_to :building

  if Rails.env.production?
    PAPERCLIP_OPTS = { :styles => { :small => "200x200#", :index => "119x111#"},
                       :storage => :s3,
                       :bucket => S3_BUCKET_NAME,
                       :s3_credentials => {
                         :access_key_id => AWS_ACCESS_KEY_ID,
                         :secret_access_key => AWS_SECRET_ACCESS_KEY
                       }}

  else Rails.env.development?
    PAPERCLIP_OPTS = { :styles => { :small => "200x200#", :index => "119x111#"} }
  end

  has_attached_file :image, PAPERCLIP_OPTS


  def building_name
    building.address
  end
end
