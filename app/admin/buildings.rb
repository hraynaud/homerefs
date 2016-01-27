ActiveAdmin.register Building do
  filter :neighborbood, :collection => Neighborhood.order("name asc")
  filter :address
  filter :rent_min
  filter :rent_max
  filter :avg_rent
  filter :doorman, :as => :select
  filter :elevator, :as => :select
  filter :super, :as => :select
  filter :coop, :as => :select
  filter :construction_type, :as => :select, :collection => Building::CONSTRUCTION.invert
  filter :avg_rent, :as => :numeric


  controller do
    def scoped_collection
      end_of_association_chain.includes(:neighborhood )
    end

    def edit
      edit! do
        5.times{ @building.building_images.build}
      end
    end
  end

  index do

    column :address
    column "Reviews" do |b|
      b.reviews_count
    end
    column :avg_rent
    column :reviewer_avg_rent
    column :rent_range do |b|
      b.rent_range
    end
    column :neighborhood, :sortable =>'neighborhoods.name', :collection => proc {Neighborhood.pluck.(:name)}
    column :doorman do |b|
      b.doorman ? "Yes" : "No"
    end

    column :elevator do |b|
      b.elevator ? "Yes" : "No"
    end

    column :super do |b|
      b.super ? "Yes" : "No"
    end

    column :coop do |b|
      b.coop ? "Yes" : "No"
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
      row :avg_rent 
      row :reviewer_avg_rent 
      row :neighborhood
      row :rent_range
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
        image_tag(building.default_building_image.image.url) if building.default_building_image
      end
    end
    panel "All Images" do
      table_for(building.building_images) do |t|
        t.column("Image") {|img| image_tag img.image.url(:small)}
      end
    end
  end


  form do |f|
    f.inputs "#{building.name.titleize}" do
      f.input :address, :input_html => { :size => 10 }
      f.input :elevator
      f.input :super
      f.input :coop
      f.input :avg_rent, :input_html =>{:step => 25, :min =>250}, :label => "Avg Rent (Manually overrides avg from reviews)"
      f.input :reviewer_avg_rent, :as => :string, :input_html =>{:disabled => true}, :label => "Auto calculated from reviews" 
      f.input :rent_min, :input_html =>{:step => 25, :min =>250}
      f.input :rent_max, :input_html =>{:step => 25, :min =>250}
      f.input :rent_range, :input_html =>{:step => 25, :min =>250}, :input_html =>{:disabled => true}, :label => "Rent Range (Auto calculated)"
      f.input :city
      f.input :zipcode
      f.input :neighborhood
      f.input :construction_type, :as => :radio, :collection => Building::CONSTRUCTION.invert
      f.input :default_image_id, :as => :select, :collection => building.building_images.map(&:id)
    end

    f.inputs do
      f.semantic_fields_for  :building_images do |ff|
        ff.input :image, :as =>  :file
      end
    end
    f.buttons :commit
  end

end
