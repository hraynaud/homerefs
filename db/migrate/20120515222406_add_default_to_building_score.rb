class AddDefaultToBuildingScore < ActiveRecord::Migration
  def change
    change_column :buildings, :score, :float, :default => 0.0
  end
end
