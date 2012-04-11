class Review < ActiveRecord::Base

  FIELDS = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

  belongs_to :apartment
  belongs_to :user
  validates :comment, :length => { :maximum => 140 }

  after_create :calc_score


  private

  def calc_score

    score = 0.0
    FIELDS.each do |f|
      field = ReviewMetadata.where(:field_name => f).first
      score += field.field_weight/100.0 * self.send(f.to_sym)
    end

    apt = Apartment.find(apartment_id)
    num_reviews = Review.where(:apartment_id => apartment_id).count

    (apt.avg_score += score)/num_reviews
  end

end
