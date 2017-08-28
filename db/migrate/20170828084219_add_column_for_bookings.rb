class AddColumnForBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :amount, :integer
  end
end
