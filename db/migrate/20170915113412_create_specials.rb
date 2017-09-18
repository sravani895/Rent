class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
