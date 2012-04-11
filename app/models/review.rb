class Review < ActiveRecord::Base

  FIELDS = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

  belongs_to :apartment
  belongs_to :user
  validates :comment, :length => { :maximum => 140 }

  after_create :calc_score


  private

  def calc_score
    apt = Apartment.find(apartment_id)
    num_reviews = Review.where(:apartment_id => apartment_id).count
    score = 0.0
    avg_score = apt.avg_score || 0.0

    FIELDS.each do |f|
      field = ReviewMetadata.where(:field_name => f).first
      score += field.field_weight/100.0 * self.send(f.to_sym)
    end


    (avg_score += score)/num_reviews
    apt.avg_score = avg_score
    apt.save
  end

end
