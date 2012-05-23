class AddFieldsToBuilding < ActiveRecord::Migration

  def change
    add_column :buildings, :doorman, :boolean
    add_column :buildings, :elevator, :boolean
    add_column :buildings, :super, :boolean
    add_column :buildings, :coop, :boolean
    add_column :buildings, :construction_date, :date
  end

end
