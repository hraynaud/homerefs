class RemoveTableNameFromHighLowTexts < ActiveRecord::Migration
  def up
    remove_column :hi_low_texts, :table_name
  end

  def down
  end
end
