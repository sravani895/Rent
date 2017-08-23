class RemoveColumnForRooms < ActiveRecord::Migration
  def change
  	remove_column :rooms, :image, :string
  end
end
