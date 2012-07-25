ActiveAdmin.register Neighborhood do
  index do
    column :name
    column "No buildings" do |n|
      n.buildings.count
    end
    column "No Reviews"  do |n|
      n.num_reviews
    end
    column :location

  end

  show :title => :name do
    attributes_table do
      row "Buildings Count" do
        neighborhood.buildings.count
      end
      row "Highest Rated Building" do
        neighborhood.buildings.highest_rated.address
      end
      row :location
    end
  end


end
