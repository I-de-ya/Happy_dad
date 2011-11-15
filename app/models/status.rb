class Status < ActiveRecord::Base
	has_many :devices
	
	has_many :location_statuses
	has_many :locations, :through =>  :location_statuses
end
