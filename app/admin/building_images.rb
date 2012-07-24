ActiveAdmin.register BuildingImage do
  index do

    column "Address" do |b|
      b.building.address
    end

    column "Image" do |b|
      image_tag(b.image.url(:small))
    end

    default_actions
  end

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

  form do |f|
    f.inputs "Main" do
      f.input :building, :as => :select, :collection => Building.all.map{|b|[b.address, b.id]}
      f.input :user, :as => :select, :collection => User.all.map{|u|[u.name, u.id]}
      f.input :image, :as => :file, :label => "Image"
      f.buttons :commit
    end
  end

end
