class ModifyNeghborhoodToNeighborhoodId < ActiveRecord::Migration
  def up
    remove_column :buildings, :neighborhood
    add_column :buildings, :neighborhood_id, :integer
  end

  def down
  end
end
