class ReplacementPair < ActiveRecord::Base
	belongs_to :device
	belongs_to :replacement, :class_name => "Device"
	belongs_to :replacement_order
end