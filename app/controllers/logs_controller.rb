class LogsController < ApplicationController

	def create
		@log = Log.new(params[:status])
		@log.status = @device.title
		redirect_to @device
	end

end
