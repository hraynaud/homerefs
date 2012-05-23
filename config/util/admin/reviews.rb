ActiveAdmin.register Review do
  index do
    column :id
    column :user_id
    column :building_address
    column :created_at
    column :updated_at
    column :comment
    default_actions
  end

  show do
    attributes_table :id, :cleanliness, :pests, :sunlight, :convenience, :noise_level, :ceilings, :closet_space, :intercom_system, :temp_control, :appliances, :countertops, :floors, :bathrooms, :walls, :utilities, :neighbors, :laundry, :mass_transit, :neighborhood, :storage, :packages, :super
    div do
      review.building_images.each do |img|
        div do
          img.id
        end
        div do
        image_tag img.image.url(:small)
        end
      end
    end
  end
end

