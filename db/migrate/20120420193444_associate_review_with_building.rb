class AssociateReviewWithBuilding < ActiveRecord::Migration
  def up
    rename_column :reviews, :apartment_id, :building_id
  end

  def down
  end
end
