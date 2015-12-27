ActiveAdmin.register Review do

  filter :building
  filter :assessment, :as => :select, :collection => Review::FLAGS.invert
  filter :score

  controller do
    def scoped_collection
      end_of_association_chain.includes(:building )
    end
  end


  index do
    column :id
    column :user_id
    column :building, :sortable => 'buildings.name', :collection => proc {Building.all.map(&:name)}
    column :score, :sortable => false

    column :assessment do |r|
      r.recommendation
    end
    column :created_at
    column :updated_at
    column :comment
    default_actions
  end

  show  do |review|
    panel  'Review Summary' do
      render "summary"
    end

    attributes_table do
      row :building
      row :cleanliness
      row :pests
      row :sunlight
      row :noise_level
      row :ceilings
      row :closet_space
      row :temp_control
      row :appliances
      row :countertops
      row :floors
      row :bathrooms
      row :walls
      row :utilities
      row :neighbors
      row :laundry
      row :prox_mass_transit
      row :neighborhood
      row :value
      row :storage
      row :super
    end

    panel "Review Images" do
      table_for(review.building_images) do |t|
        t.column("Image") {|img| image_tag img.image.url(:small)}
      end
    end
  end


  form do |f|
    f.inputs "Review Answers" do
      f.input :building
      f.input :cleanliness, :input_html =>{:min=>1, :max => 5}
      f.input :pests, :input_html =>{:min=>1, :max => 5}
      f.input :sunlight, :input_html =>{:min=>1, :max => 5}
      f.input :prox_mass_transit, :input_html =>{:min=>1, :max => 5}
      f.input :noise_level, :input_html =>{:min=>1, :max => 5}
      f.input :ceilings, :input_html =>{:min=>1, :max => 5}
      f.input :closet_space, :input_html =>{:min=>1, :max => 5}
      f.input :temp_control, :input_html =>{:min=>1, :max => 5}
      f.input :appliances, :input_html =>{:min=>1, :max => 5}
      f.input :countertops, :input_html =>{:min=>1, :max => 5}
      f.input :bathrooms, :input_html =>{:min=>1, :max => 5}
      f.input :floors, :input_html =>{:min=>1, :max => 5}
      f.input :walls, :input_html =>{:min=>1, :max => 5}
      f.input :utilities, :input_html =>{:min=>1, :max => 5}
      f.input :neighbors, :input_html =>{:min=>1, :max => 5}
      f.input :laundry, :input_html =>{:min=>1, :max => 5}
      f.input :neighborhood, :input_html =>{:min=>1, :max => 5}
      f.input :value, :input_html =>{:min=>1, :max => 5}
      f.input :storage, :input_html =>{:min=>1, :max => 5}
      f.input :super
      f.input :comment, as: :text
    end

  end


end

