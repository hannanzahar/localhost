class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
    has_many :conversations, :foreign_key => :sender_id
	# uncomment this when the form is ready for uploading image
	mount_uploader :avatar, AvatarUploader
	geocoded_by :address
  	after_validation :geocode 

 #  	this will allow you to have a form with multiple input that will allow you to search 
 #  	def address
 #  		[street, city, state, country].compact.join(', ')
	# end
end
