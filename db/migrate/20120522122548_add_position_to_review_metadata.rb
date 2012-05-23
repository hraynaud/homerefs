class AddPositionToReviewMetadata < ActiveRecord::Migration
  def change
    add_column :review_metadata, :position, :integer

  end
end
