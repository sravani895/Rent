class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.integer :room_id
      t.boolean :is_confirmed, default: false

      t.timestamps null: false
    end
  end
end
