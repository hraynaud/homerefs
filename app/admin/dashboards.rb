ActiveAdmin::Dashboards.build do
  section "HomeRefs Box Scores" do

    attributes_table_for(SiteStat.instance) do
      row :number_of_buildings
      row :number_of_reviews
      row :number_of_users
      row :highest_rated
    end


  end

  section "Recent Reviews" do
    div do
      ul do
        Review.order("updated_at desc").limit(5).collect do |review|
          li link_to(review.building.address, admin_review_path(review))
        end
      end

    end
  end

 
end
