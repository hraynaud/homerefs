class RemoveFeedbackFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :feedback
  end

  def down
  end
end
