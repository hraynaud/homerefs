class AddCachedScoreToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :cached_score, :integer

  end
end
