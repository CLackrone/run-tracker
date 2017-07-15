class Runner < ActiveRecord::Base
	has_many :runs

	has_secure_password
	validates :username, :email, presence: true
end