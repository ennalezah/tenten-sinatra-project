class RemoveIndexFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, name: :index_users_on_username_and_email
  end
end
