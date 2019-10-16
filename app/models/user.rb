class User < ApplicationRecord
	has_secure_password
	has_many :user_requirements
	accepts_nested_attributes_for :user_requirements, allow_destroy: true
	
	#validation for user
	validates :email, presence: true
	validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..15},
                       :on => :create

end
