class User < ActiveRecord::Base

	has_secure_password

	validates_presence_of :password_confirmation

	validates :first_name, :presence => true, length: { maximum: 50 }
	validates :last_name, :presence => true, length: { maximum: 50 }
	validates :user_id, :presence => true, length: { minimum:6, maximum: 20 }
	validates :password, :presence => true, length: { minimum:6, maximum: 12 }
	validates :email, :presence => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	validates_uniqueness_of :user_id
	validates_uniqueness_of :email

end
