require 'field_avgs'
class Building < ActiveRecord::Base
  include FieldAvgs
  define_field_avgs

  CONSTRUCTION = {1=>"Pre-War",2 => "Post-War", 3=>"New Construction"}
  belongs_to :neighborhood
  has_many :reviews
  has_many :reviewers,:through => :reviews, :source => :user
  validates :neighborhood, :presence => true
  validates :address, :presence => true
  validates_format_of :zipcode,
    :with => %r{\d{5}(-\d{4})?},
    :message => "should be 12345 or 12345-1234", :if => "zipcode.present?"

  before_create :normalize
  has_many :building_images

  def self.search(params = {})

    building= where(:zipcode => params[:zipcode].strip) if params[:zipcode].present?
    building= where(:address => params[:address].strip) if params[:address].present?
    building= where(:neighborhood_id => params[:neighborhood].strip) if params[:neighborhood].present?
    building
  end

  def normalize
    self.address = self.address.downcase.strip
    self.zipcode = self.zipcode.strip
  end

  def reviewer_average_age
    if reviewers.count > 0
      cnt = reviewers.uniq.count
      reviewers.uniq.map(&:age).inject{|sum,a|sum+a}.to_f/cnt
    else
      0
    end
  end

  def construction
    CONSTRUCTION[construction_type]
  end

  def has_doorman
    doorman ? "Yes" : "No"
  end

  def has_elevator
    elevator ? "Yes" : "No"
  end

  def has_super
    self.super ? "Yes" : "No"
  end

  def is_coop
    self.coop ? "Yes" : "No"
  end


  def avg_score

    fields = ReviewMetadata.all_fields
    total_score = 0
    reviews.each do  |r|
      score = 0.0

      fields.each do |f|
        field = ReviewMetadata.where(:field_name => f).first
        score += field.field_weight * r.send(f.to_sym)
        score
      end
      total_score += score
    end
    reviews !=[] ? total_score/reviews.count : 0

  end

end
