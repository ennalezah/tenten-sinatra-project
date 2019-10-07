class ReaddUserIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id
    add_column :posts, :user_id, :integer
  end
end
