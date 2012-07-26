class Review < ActiveRecord::Base

  FLAGS = {0=>"Not Recommend",1 => "Neutral", 2=>"Would Recommend"}
  APT_SIZE = {0=>"Studio",1 => "1 Bedroom", 2=>"2 Bedroom", 3 =>">2"}

  belongs_to :building, :counter_cache => true
  belongs_to :user
  validates_numericality_of :years_lived, :greater_than => 0
  validates :comment, :length => { :maximum => 140 }
  has_many :building_images

  attr_accessor :image1, :image2, :image3

  scope :studio, where(:apt_size => APT_SIZE.invert["Studio"])
  scope :one_bedroom, where(:apt_size => APT_SIZE.invert["1 Bedroom"])
  scope :two_bedroom, where(:apt_size => APT_SIZE.invert["2 Bedroom"])
  scope :two_plus_bedroom, where(:apt_size => APT_SIZE.invert[">2"])
  scope :rent_included, where("monthly_fee is not null")

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


  def score
    cached_score || calc_score
  end

  def calc_score
    score = 0.0

    ReviewMetadata.all_fields.each do |f|
      field = ReviewMetadata.where(:field_name => f).first
      score += field.field_weight * self.send(f.to_sym)
      score
    end
    self.cached_score = score
    save
    score
  end

  def values
    ReviewMetadata.all_fields.each.inject({}) do |vals, k|
      vals[k]=send(k.to_sym); vals
    end
  end
  private

end
