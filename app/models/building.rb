class Building < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :reviews
  validates :neighborhood, :presence => true
  validates :address, :zipcode, :presence => true
  validates_format_of :zipcode,
    :with => %r{\d{5}(-\d{4})?},
    :message => "should be 12345 or 12345-1234"

  before_create :normalize
  has_many :building_images

  def self.search(params = {})

     building= where(:zipcode => params[:zipcode].strip) if params[:zipcode].present?
     building= where(:address => params[:address].strip) if params[:address].present?
     # building= where(:neighborhood => params[:neighborhood].strip) if params[:neighborhood].present?
     building
  end


  def normalize
    self.address = self.address.downcase.strip
    self.zipcode = self.zipcode.strip
  end

end
