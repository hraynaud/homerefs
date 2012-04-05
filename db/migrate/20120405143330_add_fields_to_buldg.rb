class AddFieldsToBuldg < ActiveRecord::Migration
  def change
    add_column :buildings, :construction_date, :date
  end
end
