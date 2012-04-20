class Building < ActiveRecord::Base
  has_many :reviews
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
