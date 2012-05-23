namespace :util do
  desc "resets building reviews count"
  task :reset_bldg_revs_count => [:environment] do
    ids = Set.new
    Review.all.each {|r| ids << r.building_id}
    ids.each do |building_id|
      b = Building.find(building_id)
      (b.score=0.0; b.save) unless b.nil?
      Building.reset_counters(building_id, :reviews)
    end
  end
end

