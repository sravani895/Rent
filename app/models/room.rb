class Room < ActiveRecord::Base
	#mount_uploader :image, ImageUploader
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms
	belongs_to :user
	belongs_to :city
	has_many :bookings
	has_many :images
	has_many :reviews
	has_many :specials
	accepts_nested_attributes_for :images
validates_presence_of :name, :description, :price, :rules, :minimum_days, :address, :lat, :lng
after_create :send_an_email
after_create :changing_role
after_update :sending_confirmation_mail
def send_an_email
	Notification.isauthorize_confirmation(self).deliver_now!
end
def sending_confirmation_mail
	NotificationForHost.authorized_confirmation(self).deliver_now!
end

def changing_role
	if self.user.role_id == Role.find_by_name("guest").id
		self.user.role_id = Role.find_by_name("host").id
		#self.user.role_id = role
		#binding.pry
		self.user.save
		#binding.pry
	end
end
	
end
