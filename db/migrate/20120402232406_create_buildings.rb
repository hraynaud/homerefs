class CreateBuilding < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address

      t.timestamps
    end
  end
end
