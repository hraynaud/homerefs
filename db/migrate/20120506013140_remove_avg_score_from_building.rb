class RemoveAvgScoreFromBuilding < ActiveRecord::Migration
  def up
    remove_column :buildings, :avg_score
  end

  def down
  end
end
