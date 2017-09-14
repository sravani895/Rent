class CreateSpecialPrices < ActiveRecord::Migration
  def change
    create_table :special_prices do |t|
      t.integer :price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
