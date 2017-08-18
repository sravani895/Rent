class Room < ActiveRecord::Base
	has_many :amenities
	belongs_to :user
	belongs_to :city
validates_presence_of :name, :description, :price, :rules, :minimum_days, :address, :lat, :lng
#after_create :send_an_email
after_create :changing_role
def send_an_email
	Notification.isauthorize_confirmation.deliver_now!
end
def changing_role
	if self.user.role_id == Role.find_by_name("guest").id
		self.user.role_id = Role.find_by_name("host").id
		#binding.pry
		self.user.save
		#binding.pry
		
	end
end
	
end
