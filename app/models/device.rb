class Device < ActiveRecord::Base
	belongs_to :status
	belongs_to :location
	
	belongs_to :replacement, :class_name => "Device", :foreign_key => "replacement_id"
	
	def find_matching
	  Device.where(:factor => device.factor).where( "id IS NOT ?", self.id)
  end
end
