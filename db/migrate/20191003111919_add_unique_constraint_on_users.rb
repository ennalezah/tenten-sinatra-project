class AddUniqueConstraintOnUsers < ActiveRecord::Migration
  def change
    add_index :users, [:username, :email], :unique => true
  end
end
