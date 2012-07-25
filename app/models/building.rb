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
  has_one :default_building_image, :class_name => "BuildingImage", :conditions => proc{["building_images.id = ?", default_image_id || building_images.first ]}
  default_scope order('created_at')
  paginates_per 5

  def self.highest_rated
    self.all.max_by(&:avg_score)
  end


  def self.locate(params = {})

    building= where(:zipcode => params[:zipcode].strip) if params[:zipcode].present?
    building= where(:address => params[:address].strip) if params[:address].present?
    building= where(:neighborhood_id => params[:neighborhood].strip) if params[:neighborhood].present?
    building
  end

  def self.find_by_reviewer_average_rent(op, amt, type=nil)
    Building.all.select { |b| b.reviewer_avg_rent(type).send(op.to_sym, amt) }
  end

  def self.find_by_avg_rent(op, amt )
    Building.where("avg_rent #{op} ?", amt)
  end

  def reviewer_avg_rent(type = nil)
    arr = type ? reviews.send(type.to_s) : reviews
    arr = arr.select {|rev|rev.monthly_fee}
    arr.empty? ? "-" : arr.inject(0.0) {|sum, rev| sum + rev.monthly_fee}/arr.size
  end

  def self.super_search(params)
    self.locate(params).search(params[:search])
  end

  def self.search(search)
    where('address like ?', "%#{search}%")
  end

  def normalize
    self.address = self.address.downcase.strip
    self.zipcode = self.zipcode.strip
  end

  def reviewer_average_age
    if reviewers.count > 0
      cnt = reviewers.uniq.count
      (reviewers.uniq.map(&:age).inject{|sum,a|sum+a}.to_f/cnt).round
    else
      0
    end
  end


  def average_years_lived
    if reviews.count > 0
      cnt = reviews.uniq.count
      (reviews.uniq.map(&:years_lived).inject{|sum,a|sum+a}.to_f/cnt).round
    else
      0
    end
  end

  def apt_types
    types = {}
    reviews.each do |r|
      if !r.apt_size.nil?
        key = r.apt_size ==0 ? "Studio" : "#{r.apt_size} BR"
        types[key] = types[key].present? ? types[key]+1 : 1
      end
    end
    types
  end

  def flags_thrown
    flags = {}
    reviews.each do |r|
      key = Review::FLAGS[r.assessment]
      flags[key] = flags[key].present? ? flags[key]+1 : 1
    end
    flags
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
    return 0 if reviews.count ==0
    sum = 0;
    reviews.each{ |r| sum += r.score }
    sum.to_f/reviews.count
  end

end
