class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :apartment_id
      t.integer :cleanliness, :pests, :sunlight, :convenience, :noise_level, :ceilings, :closet_space, :intercom_system
      t.integer :temp_control,:appliances, :countertops, :floors, :bathrooms, :walls
      t.integer :utilities, :neighbors, :laundry, :mass_transit, :neighborhood
      t.integer :storage, :packages, :super

      t.timestamps
    end
  end
end
