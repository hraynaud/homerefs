class RevertBuildingDefaultScoreTo < ActiveRecord::Migration
  def up
    change_column :buildings, :score, :float, :default => nil
  end

  def down
    change_column :buildings, :score, :float, :default => 0.0
  end
end
