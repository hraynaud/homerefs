class AddMonthlyFeeToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :monthly_fee, :decimal,:precision => 8, :scale => 2
  end
end
