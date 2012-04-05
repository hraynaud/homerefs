class Apartment < ActiveRecord::Base
  belongs_to :building
  has_many   :reviews
end
