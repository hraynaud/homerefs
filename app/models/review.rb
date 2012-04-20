class Review < ActiveRecord::Base

  FIELDS = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

  belongs_to :building
  belongs_to :user
  validates :comment, :length => { :maximum => 140 }

  after_create :calc_score


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
