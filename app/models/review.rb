class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	validates_length_of :review, :minimum => 150
	ratyrate_rateable "food_rating","cleanliness_rating","safety_rating","facility_rating","locality_rating"
end
