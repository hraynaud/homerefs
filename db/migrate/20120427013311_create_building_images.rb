class CreateBuildingImages < ActiveRecord::Migration
  def change
    create_table :building_images do |t|
      t.integer :building_id
      t.integer :user_id
      t.integer :review_id
      t.string :image_file_name

      t.timestamps
    end
  end
end
