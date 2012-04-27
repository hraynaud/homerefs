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
end

