class ChangeAvgScoreType < ActiveRecord::Migration
  def up
    change_column :apartments, :avg_score, :float, :default => 0.0
  end

  def down
  end
end
