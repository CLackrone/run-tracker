class Runner < ActiveRecord::Base
	has_many :runs

	has_secure_password
	validates :username, :email, presence: true
	validates :username, :email, uniqueness: true

	def slug
    	username.downcase.gsub(" ","-")
  	end

  	def self.find_by_slug(slug)
   		Runner.all.find{|runner| runner.slug == slug}
  	end

end