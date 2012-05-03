class ChangeReviewFields < ActiveRecord::Migration
  def up
    remove_column :reviews, :intercom_system
    remove_column :reviews, :convenience
    remove_column :reviews, :packages
    rename_column :reviews, :mass_transit, :prox_mass_transit
    add_column :reviews, :rent, :integer
  end

  def down
  end
end
