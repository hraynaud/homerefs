require 'singleton'
class SiteStat
  include Singleton
  extend ActiveModel::Naming

  def number_of_buildings
    Building.all.count
  end

  def number_of_reviews
    Review.all.count
  end

  def number_of_users
    User.all.count
  end

  def highest_rated
    Building.highest_rated.address.titleize
  end




  def to_key
    [1]
  end
end
