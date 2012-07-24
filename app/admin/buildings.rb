ActiveAdmin.register Building do

  index do

    column :address
    column "Reviews" do |r|
      r.reviews_count
    end
    column :neighborhood
    column :doorman do |r|
      r.doorman ? "Yes" : "No"
    end

    column :elevator do |r|
      r.elevator ? "Yes" : "No"
    end

    column :super do |r|
      r.super ? "Yes" : "No"
    end

    column :coop do |r|
      r.coop ? "Yes" : "No"
    end
    column :construction
    column :zipcode
    default_actions
  end


  show :title => :address do |building|
    attributes_table do
      row "Reviews" do
        building.reviews_count
      end
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
    panel "All Images" do
      table_for(building.building_images) do |t|
        t.column("Image") {|img| image_tag img.image.url(:small)}
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
