class RenameAptToBldg < ActiveRecord::Migration
  def up
    rename_table :apartments, :buildings
  end

  def down
  end
end
