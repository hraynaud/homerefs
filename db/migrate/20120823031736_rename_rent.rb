class RenameRent < ActiveRecord::Migration
  def up
    rename_column :reviews, :rent, :good_value
  end

  def down
    rename_column :reviews, :good_value, :rent
  end
end
