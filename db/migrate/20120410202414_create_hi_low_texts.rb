class CreateHiLowTexts < ActiveRecord::Migration
  def change
    create_table :hi_low_texts do |t|

      t.string :table_name
      t.string :field_name
      t.string :hi_text
      t.string :low_text
      t.timestamps
    end
  end
end
