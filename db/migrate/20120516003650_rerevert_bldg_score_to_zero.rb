class RerevertBldgScoreToZero < ActiveRecord::Migration
  def up
    change_column :buildings, :score, :float, :default => 0.0
  end

  def down
    change_column :buildings, :score, :float, :default => nil
  end
end
