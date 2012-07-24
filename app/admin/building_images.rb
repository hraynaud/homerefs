ActiveAdmin.register BuildingImage do

  show  :title => proc {"Uploaded image for: #{building_image.building_name}"}  do |building_image|
    attributes_table do
      row :buildiing do
        building_image.building.address
      end
      row :image do
        image_tag(building_image.image.url)
      end
      row :user
      row :id
    end
  end


  end
