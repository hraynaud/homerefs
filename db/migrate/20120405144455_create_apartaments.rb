class CreateApartaments < ActiveRecord::Migration
  def change
    create_table :apartaments do |t|

      t.string :unit
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sqft
      t.timestamps
    end
  end
end
