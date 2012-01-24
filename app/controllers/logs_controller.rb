# coding: utf-8
class LogsController < ApplicationController
	
	def index
		@logs = Log.all
	end

	
	def sozdat
		session[:changes].keys.each do |changed_params|
		@log = Log.new
		@log.device_id = session[:changed_device]
		@log.attr = changed_params
		@log.old_value = session[:changes][changed_params].first
		@log.new_value = session[:changes][changed_params].last
		@log.save
		end
		redirect_to logs_path
		session[:changed_device] = nil
		session[:changes] = nil
	end

end
