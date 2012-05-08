ActiveAdmin.register Building do
  show do
    attributes_table :id, :address, :doorman, :elevator, :super, :coop, :city, :zipcode, :neighborhood, :default_image_id, :construction_type
  end

  form :partial => "form"
end
