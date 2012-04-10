class AddDefaultToWeights < ActiveRecord::Migration
  def change
  change_column_default :review_metadata, :field_weight, 1
  end
end
