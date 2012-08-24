class RenameValueOnReview < ActiveRecord::Migration
  def up
    rename_column :reviews, :good_value, :value
  end

  def down
    rename_column :reviews, :value, :good_value
  end
end
