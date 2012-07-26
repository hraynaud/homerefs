ActiveAdmin.register User do
  filter :first_name
  filter :last_name
  filter :email
  filter :gender, :as => :select, :collection => ['m', 'f']

  index do
    column :first_name
    column :last_name
    column :email
    column :age, :sortable => false


    column :gender do |u|
      u.gender.upcase
    end
  end

end
