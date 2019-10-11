class ChangeTitleToLocationName < ActiveRecord::Migration
  def change
    rename_column :posts, :title, :location_name
  end
end
