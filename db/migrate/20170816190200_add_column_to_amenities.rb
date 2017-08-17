class AddColumnToAmenities < ActiveRecord::Migration
  def change
  	add_column :amenities, :room_id, :integer
  end
end
