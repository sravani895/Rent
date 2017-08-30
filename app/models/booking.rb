class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	validate :booking_room, on: :create
	after_create :send_mail_for_host
	after_update :send_mail_for_user
	private
	def booking_room
		bookings = Booking.where('room_id=?',self.room_id)
		new_dates = (self.start_date.to_datetime..self.end_date.to_datetime).to_a
		bookings.each do |book|
			#binding.pry
			previous_dates = (book.start_date.to_datetime..book.end_date.to_datetime).to_a
			#binding.pry
				if (self.start_date <= Date.today) || (self.end_date <= Date.today) || (previous_dates - new_dates).length != previous_dates.length	
				#binding.pry		
				self.errors.add(:base, "room is not available for booking")
			end
		end
	end
	def send_mail_for_host
		NotificationForBooking.is_confirmed_confirmation(self).deliver_now!
	end
	end
