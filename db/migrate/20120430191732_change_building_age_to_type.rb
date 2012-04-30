class ChangeBuildingAgeToType < ActiveRecord::Migration
  def up
    remove_column :buildings, :construction_date
    add_column :buildings, :construction_type, :integer
  end

  def down
  end
end
