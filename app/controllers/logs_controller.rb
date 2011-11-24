class LogsController < ApplicationController
	def create
		@log = Log.new
		@log.device_id = session[:device_old_state].id
		device_new_state = Device.find(session[:device_old_state].id)
		device_old_state = session[:device_old_state]
	
	
	end
end
