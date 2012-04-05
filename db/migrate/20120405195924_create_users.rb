class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :facebook_authentication_token
      t.string :facebook_authentication_secret
      t.string :first_name
      t.string :last_name
      t.string :facebook_image_url
      t.string :location
      t.string :facebook_nickname
      t.timestamps
    end
  end
end
