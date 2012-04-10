class AddCommentsandFeedbacktoReview < ActiveRecord::Migration
  def up
    add_column :reviews, :comment, :string
    add_column :reviews, :feedback, :string
  end

  def down
  end
end
