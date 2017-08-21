class RemoveColumnForAmenities < ActiveRecord::Migration
  def change
  	remove_column :amenities, :room_id
  end
end
