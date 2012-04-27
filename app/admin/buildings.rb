ActiveAdmin.register Building do
  show do
    attributes_table :id, :address, :doorman, :elevator, :super, :coop, :construction_date, :city, :zipcode, :avg_score, :neighborhood, :default_image_id
  end

  form :partial => "form"
end
