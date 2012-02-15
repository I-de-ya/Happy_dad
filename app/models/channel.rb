class Channel < ActiveRecord::Base
	has_one :auto_position
	belongs_to :device
end