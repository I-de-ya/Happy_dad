class Location < ActiveRecord::Base
	has_many  :devices
	
	has_many :location_statuses
	has_many :statuses, :through =>  :location_statuses
end
