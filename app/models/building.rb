class Building < ActiveRecord::Base
  has_many :reviews
  validates :address, :zipcode, :presence => true
  validates_format_of :zipcode,
    :with => %r{\d{5}(-\d{4})?},
    :message => "should be 12345 or 12345-1234"

  before_create :normalize

  def self.search(params = {})
    address = params[:address] if params[:address].present?
    zipcode = params[:zipcode] if params[:zipcode].present?

    if address && zipcode
      where(:address => address.downcase.strip, :zipcode => zipcode.strip)
    end
  end


  def normalize
    self.address = self.address.downcase.strip
    self.zipcode = self.zipcode.strip
  end

end
