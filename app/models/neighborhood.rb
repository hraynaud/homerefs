class Neighborhood < ActiveRecord::Base
  has_many :buildings
  has_many :reviews, :through => :buildings

  def num_reviews
      reviews.count
  end

  def highest_rated_address
    if ! buildings.empty?
      buildings.highest_rated.address
    end
  end

end
