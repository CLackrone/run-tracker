class Run < ActiveRecord::Base
	belongs_to :runner

	validates :location, :distance, :date, presence: true
end