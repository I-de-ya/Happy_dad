# coding: utf-8
class DevicesController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@devices = Device.order(sort_column + " " + sort_direction)
	end
	
	def new
		@device = Device.new
	end
	
	def create
		@device = Device.new(params[:device])
			if @device.save
				redirect_to @device
			else
				render :action => "new"
				# Можно ли заменить на render "new"?
				# И в чем разница между render "new" и render 'new'?
			end
	end
	
	def edit
		@device = Device.find(params[:id])
	end
	
	def update
		@device = Device.find(params[:id])
			if @device.update_attributes(params[:device])
				redirect_to @device
				# ^ Эквивалентно ли render "show"?
			else
				render "edit"
			end
	end
	
	def show
		@device = Device.find(params[:id])
	end

	def delete
  	@speech = Speech.find(params[:id])
  end

	def destroy
		@device = Device.find(params[:id]).destroy

  	flash[:success] = "Устройство было удалено."
  	redirect_to devices_path
	end
	
	def replacement_candidates
		@device = Device.find(params[:id])
		session[:current_device_id] = @device.id
		@devices = Device.where(:replace_param => @device.replace_param) - [@device]
	end
	

	private
	
	def sort_column
		Device.column_names.include?(params[:sort]) ? params[:sort] : "title"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
end
