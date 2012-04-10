class AddDefaultsToHighLowText < ActiveRecord::Migration
  def change
  change_column_default :hi_low_texts, :hi_text , "High"
  change_column_default :hi_low_texts, :low_text, "Low"
  end
end
