class Neighborhood < ActiveRecord::Base
  has_many :buildings
  has_many :reviews, :through => :buildings

  def num_reviews
      reviews.count
  end

end
