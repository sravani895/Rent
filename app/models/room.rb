class Room < ActiveRecord::Base
	has_many :amenities
	belongs_to :user
	belongs_to :city

 after_create :send_an_email

def send_an_email
	Notification.isauthorize_confirmation.deliver_now!
end
	
end
