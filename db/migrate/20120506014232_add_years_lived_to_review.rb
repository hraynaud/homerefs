class AddYearsLivedToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :years_lived, :integer, :default => 1

  end
end
