# coding: utf-8
class LogsController < ApplicationController
	
	def index
		@logs = Log.all
		@logg = session[:changed_params]
	
	end
	
	def sozdat
		@log = Log.new
		@log.device_id = session[:device_old_state].id
		device_new_state = Device.find(session[:device_old_state].id)
		device_old_state = session[:device_old_state]
		@log.save
		session[:device_old_state] = nil
		redirect_to logs_path
	end
end
