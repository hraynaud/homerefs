class AddBuildingIdToApt < ActiveRecord::Migration
  def change
    add_column :apartments, :building_id, :integer
  end
end
