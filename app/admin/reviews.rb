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

  show :title => proc{"Review for: #{review.building.address}"}do
    attributes_table  :cleanliness, :pests, :sunlight, :noise_level, :ceilings, :closet_space,  :temp_control, :appliances, :countertops, :floors, :bathrooms, :walls, :utilities, :neighbors, :laundry, :prox_mass_transit, :neighborhood, :storage,  :super
    panel "Review Images" do
      table_for(review.building_images) do |t|
        t.column("Image") {|img| image_tag img.image.url(:small)}
      end
    end
  end


  form do |f|
    f.inputs "Review Criteria" do
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
      f.input :storage, :input_html =>{:min=>1, :max => 5}
      f.input :super
    end

  end


end

