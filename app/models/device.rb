class Device < ActiveRecord::Base
	belongs_to :status
	belongs_to :location
	has_one :auto_position
	has_many :logs
	
	belongs_to :replacement, :class_name => "Device", :foreign_key => "replacement_id"

	def find_matching
	  Device.where(:factor => device.factor).where( "id IS NOT ?", self.id)
  	end

  	def self.build_from_csv(row)
  		device = self.new
  		device.device_type = row[1]
  		device.title = row[3]
  		device.serial_number = row[4]
  		device.form_of_mr = row[5]
  		device.prev_mr_date = row[6]
  		device.next_mr_date = row[7]
  		device.comment = row[8]
  		device.uniq_number_in_ASOMI = row[9]
  	end

end
