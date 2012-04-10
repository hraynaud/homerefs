class Review < ActiveRecord::Base
  belongs_to :apartment
  validates :comment, :length => { :maximum => 140 }
end
