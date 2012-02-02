class Device < ActiveRecord::Base
	belongs_to :status
	belongs_to :location
	has_one :auto_position
	has_many :logs
	
	belongs_to :replacement, :class_name => "Device", :foreign_key => "replacement_id"

	def find_matching
	  Device.where(:factor => device.factor).where( "id IS NOT ?", self.id)
  	end

  	def self.search_and_paginate(search, search_field, page)
  		if search
  			paginate :per_page => 10, :page => page,
           			  :conditions => [search_field + ' like ?', "%#{search}%"]
  		else
    		paginate :per_page => 10, :page => page
  		end
  	end

end