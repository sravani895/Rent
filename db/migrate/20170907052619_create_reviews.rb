class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review
      t.float :food_rating
      t.float :cleanliness_rating
      t.float :safety_rating
      t.float :facility_rating
      t.float :locality_rating
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
