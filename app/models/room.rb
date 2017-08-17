class Room < ActiveRecord::Base
	has_many :amenities
	belongs_to :user
	belongs_to :city

	
end
