class BuildingImage < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  belongs_to :building

  S3_BUCKET_NAME = 'homerefs'
  AWS_ACCESS_KEY_ID = 'AKIAJGCCSOF46CCT2CEQ'
  AWS_SECRET_ACCESS_KEY = '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'

  PAPERCLIP_OPTS = { :styles => { :small => "200x200>", :index => "119x111#"},
        :storage => :s3,
        :bucket => S3_BUCKET_NAME,
        :s3_credentials => {
          :access_key_id => AWS_ACCESS_KEY_ID,
          :secret_access_key => AWS_SECRET_ACCESS_KEY
        }}

  has_attached_file :image, PAPERCLIP_OPTS
end
