class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	# uncomment this when the form is ready for uploading image
	mount_uploader :avatar, AvatarUploader
	geocoded_by :address
  	after_validation :geocode 


end
