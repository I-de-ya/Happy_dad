class Device < ActiveRecord::Base
	belongs_to :status
	belongs_to :location
	has_many :channels
	has_many :logs

  has_one :replacement_pair
  has_one :replacement, :through => :replacement_pair, :source => :replacement

	scope :with_next_mr_date, where('next_mr_date NOT ?', nil)

  	def self.search_and_paginate(search, search_field, page)
  		if search
  			paginate :per_page => 15, :page => page,
           			  :conditions => [search_field + ' like ?', "%#{search}%"] 
           			  # данный поиск не является нечувствительным к регистру для русского языка (для английского - является)
           			  # хотелось бы понять отличие "%#{search}%" от "#{search}", что делают %% ?
  		else
    		paginate :per_page => 15, :page => page
  		end
  	end

end