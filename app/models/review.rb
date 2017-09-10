class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	validates_length_of :review, :minimum => 10
	
end
