class Building < ActiveRecord::Base
  has_many :reviews
  validates :address, :zipcode, :presence => true
  validates_format_of :zipcode,
    :with => %r{\d{5}(-\d{4})?},
    :message => "should be 12345 or 12345-1234"

  before_create :normalize

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
