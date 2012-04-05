class RenameApartaments < ActiveRecord::Migration
  def up
    rename_table :apartaments, :apartments
  end

  def down
  end
end
