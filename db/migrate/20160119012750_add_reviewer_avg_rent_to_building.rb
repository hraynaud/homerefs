class AddReviewerAvgRentToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :reviewer_avg_rent, :float
  end
end
