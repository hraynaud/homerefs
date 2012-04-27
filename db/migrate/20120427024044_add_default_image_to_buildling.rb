class AddDefaultImageToBuildling < ActiveRecord::Migration
  def change
    add_column :buildings, :default_image_id, :integer
  end
end
