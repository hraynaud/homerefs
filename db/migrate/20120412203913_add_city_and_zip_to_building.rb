class AddCityAndZipToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :city, :string
    add_column :buildings, :zipcode, :string
  end
end
