class Review < ActiveRecord::Base

  FLAGS = {-1=>"Not Recommend",2 => "Neutral", 3=>"Would Recommend"}
  APT_SIZE = {0=>"Studio",1 => "1 Bedroom", 2=>"2 Bedroom"}

  belongs_to :building
  belongs_to :user
  validates :comment, :length => { :maximum => 140 }
  has_many :building_images

  attr_accessor :image1, :image2, :image3
  after_create :calc_score

  def building_address
    self.building.address
  end

  def recommendation
      FLAGS[assessment]
  end

  def recommendation
      FLAGS[assessment]
  end

  def size
    APT_SIZE[apt_size]
  end
  private

  def calc_score
    bldg = Building.find(building_id)
    num_reviews = Review.where(:building_id => building_id).count
    score = 0.0
    avg_score = bldg.avg_score || 0.0

    ReviewMetadata.all_fields.each do |f|
      field = ReviewMetadata.where(:field_name => f).first
      score += field.field_weight * self.send(f.to_sym)
      score
    end


    avg_score = (score+avg_score)/num_reviews
    bldg.avg_score = avg_score
    bldg.save
  end
end
