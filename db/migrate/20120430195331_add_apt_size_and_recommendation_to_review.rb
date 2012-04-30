class AddAptSizeAndRecommendationToReview < ActiveRecord::Migration
  def change
      add_column :reviews, :apt_size, :integer
      add_column :reviews, :assessment, :integer
  end
end
