class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	validate :booking_room, on: :create
	before_create :special_calculation
	#after_create :send_mail_for_host
	#after_create :calculation
	#after_update :send_mail_for_user
	private
	def booking_room
		bookings = Booking.where('room_id=?',self.room_id)
		#binding.pry
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
	def calculation
		bookings = Booking.where('room_id=?',self.room_id)
		bookings.each do |book|
			#binding.pry
			days = (book.start_date.to_datetime..book.end_date.to_datetime).to_a.length
			#binding.pry
			amount = days * self.room.price
			self.amount = amount
			#binding.pry
			self.save
		end
		
	end
	def special_calculation
		bookings = Booking.where('room_id=?', self.room_id)
		booking_dates = (self.start_date.to_datetime..self.end_date.to_datetime).to_a
		special_dates = []
		special_price = 0
		self.room.specials.each do |special|
			binding.pry
			special_dates = (special.start_date.to_datetime..special.end_date.to_datetime).to_a
			special_price = special.price
		end
		special_count = 0
		normal_count = 0
		booking_dates.each do |bookdate|
			binding.pry
			if special_dates.include?(bookdate)
				binding.pry
				special_count +=1
				binding.pry
				amount = special_count * special_price
				self.amount = amount
			else
				normal_count +=1
				 amount = normal_count * self.room.price
				 self.amount = amount
		end
	end
end
	def send_mail_for_host
		NotificationForBooking.is_confirmed_confirmation(self).deliver_now!
	end
	def send_mail_for_user
		NotifcationForUser.is_confirmed(self).deliver_now!
	end
	end
