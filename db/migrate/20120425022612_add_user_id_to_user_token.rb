class AddUserIdToUserToken < ActiveRecord::Migration
  def change
    add_column :user_tokens, :user_id, :integer
  end
end
