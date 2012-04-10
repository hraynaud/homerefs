class RenameHiLowTextAndAddWeights < ActiveRecord::Migration
  def up
    add_column :hi_low_texts, :field_weight, :integer
    rename_table :hi_low_texts, :review_metadata
  end

  def down
  end
end
