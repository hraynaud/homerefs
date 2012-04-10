class AddAvgScoreToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :avg_score, :integer
  end
end
