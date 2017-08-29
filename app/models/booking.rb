class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	validate :booking_room
	private
	def booking_room
		bookings = Booking.where('room_id=?',self.room_id)
		new_dates = (self.start_date.to_datetime..self.end_date.to_datetime).to_a
		bookings.each do |book|
			previous_dates = (book.start_date.to_datetime..book.end_date.to_datetime).to_a
				if (self.end_date < Date.today) && (previous_dates - new_dates).length != previous_dates.length			
				self.errors.add(:base, "room is not available for booking")
			end
		end
	end
	end
