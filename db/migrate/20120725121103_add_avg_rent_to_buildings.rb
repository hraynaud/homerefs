class AddAvgRentToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :avg_rent, :decimal, :precision => 8, :scale => 2

  end
end
