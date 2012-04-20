class AddAuthFieldsAndBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :dob, :datetime
    add_column :users, :gender, :string, :limit => 1
  end
end
