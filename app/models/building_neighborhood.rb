class BuildingNeighborhood < ActiveRecord::Base
  belongs_to :building
  belongs_to :neighborhood
end
