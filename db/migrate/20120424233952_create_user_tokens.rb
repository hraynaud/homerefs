class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.timestamps
    end
  end
end
