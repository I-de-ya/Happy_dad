class LocationStatus < ActiveRecord::Base
	belongs_to :location
	belongs_to :status
end
