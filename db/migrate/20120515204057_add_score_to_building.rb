class AddScoreToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :score, :float
    add_column :buildings, :reviews_count, :integer,  :default => 0, :null => false
  end
end
