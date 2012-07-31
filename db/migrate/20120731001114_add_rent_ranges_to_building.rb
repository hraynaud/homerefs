class AddRentRangesToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :rent_min, :integer

    add_column :buildings, :rent_max, :integer

  end
end
