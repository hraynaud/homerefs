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
    column :id
    default_actions
  end

  show :title => proc {"#{@user.name}"} do |user|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row "Reviews Submitted" do
          user.reviews.count
      end
      row :id
    end

    panel "Building Reviews" do
      table_for(user.reviews) do |t|
        t.column("Building") {|review| link_to review.building.name, admin_review_path(review) }
        t.column("Score") {|review|  review.score }
        t.column("Date") {|review| review.created_at.strftime('%B %e, %Y ')}
      end
    end

  end
end
