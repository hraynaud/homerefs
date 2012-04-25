class AddAvgScoreToBldg < ActiveRecord::Migration
  def change
    add_column :buildings, :avg_score, :float
  end
end
