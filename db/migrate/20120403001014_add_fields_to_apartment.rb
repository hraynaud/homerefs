class AddFieldsToApartment < ActiveRecord::Migration

  def change
    add_column :apartments, :doorman, :boolean
    add_column :apartments, :elevator, :boolean
    add_column :apartments, :super, :boolean
    add_column :apartments, :coop, :boolean
  end

end
