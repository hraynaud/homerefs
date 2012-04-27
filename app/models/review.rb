class Review < ActiveRecord::Base

  FIELDS = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

  belongs_to :building
  belongs_to :user
  validates :comment, :length => { :maximum => 140 }
  has_many :building_images

  attr_accessor :image1, :image2, :image3
  after_create :calc_score


  # S3_BUCKET_NAME = 'homerefs'
  # AWS_ACCESS_KEY_ID = 'AKIAJGCCSOF46CCT2CEQ'
  # AWS_SECRET_ACCESS_KEY = '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'

  # PAPERCLIP_OPTS = { :styles => { :small => "200x200>"},
        # :storage => :s3,
        # :bucket => S3_BUCKET_NAME,
        # :s3_credentials => {
          # :access_key_id => AWS_ACCESS_KEY_ID,
          # :secret_access_key => AWS_SECRET_ACCESS_KEY
        # }}

  # has_attached_file :image1, PAPERCLIP_OPTS
  # has_attached_file :image2, PAPERCLIP_OPTS
  # has_attached_file :image3, PAPERCLIP_OPTS

  def building_address
    self.building.address
  end

  private

  #TODO set all reviews fields to default to 50.0
  def calc_score
    bldg = Building.find(building_id)
    num_reviews = Review.where(:building_id => building_id).count
    score = 0.0
    avg_score = bldg.avg_score || 0.0

    FIELDS.each do |f|
      field = ReviewMetadata.where(:field_name => f).first
      score += field.field_weight/100.0 * (self.send(f.to_sym) || 50.0)
    end


    (avg_score += score)/num_reviews
    bldg.avg_score = avg_score
    bldg.save
  end

end
