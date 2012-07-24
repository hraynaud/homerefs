ActiveAdmin.register Building do

  index do

    column :address
    column :neighborhood
    column :doorman do |val|
      val ? "Yes" : "No"
    end

    column :elevator do |val|
      val ? "Yes" : "No"
    end

    column :super do |val|
      val ? "Yes" : "No"
    end

    column :coop do |val|
      val ? "Yes" : "No"
    end
    column :construction
    column :zipcode
    default_actions
  end


  show :title => :address do |building|
    attributes_table do
      row :neighborhood
      row :city
      row :construction_type
      row :doorman do
        building.doorman ? "Yes" : "No"
      end
      row :elevator do
        building.elevator ? "Yes" : "No"
      end
      row :super do
        building.super ? "Yes" : "No"
      end

      row :coop do
        building.coop ? "Yes" : "No"
      end


      row :zipcode
      row :id
      row :default_image do
        image_tag(building.default_building_image.image.url)
      end
    end
  end

  form do |f|
    f.inputs "Main" do
      f.input :address, :input_html => { :size => 10 }
      # f.input :default_image_id, :as => :select, :collection => building.building_images.map(&:id)
      f.input :elevator
      f.input :super
      f.input :coop
      f.input :city
      f.input :zipcode
      f.input :neighborhood
      f.input :construction_type, :as => :radio, :collection => Building::CONSTRUCTION.invert
      f.buttons :commit
    end
  end

  # form :partial => "form"
end
