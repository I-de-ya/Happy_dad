# coding: utf-8
class DevicesController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@page = params[:page]
		@devices = Device.paginate(:page => params[:page], :per_page => 5, :conditions => ['title LIKE ?', "%#{params[:search]}%"]).order(sort_column + " " + sort_direction)
	end
	
	def replacements_list
		@devices = Device.where(:has_replacement=>true)
	
		respond_to do |format|
			format.html
			format.xls { send_data @devices.to_xls(:columns => [:title, {:replacement => [:title]}], :headers => ["С позиции", "На позицию"]), :filename => 'Замены приборов.xls'}
		end
	end
	
	def delete_replacement
		device = Device.find(params[:id])
		device.replacement_id = nil
		device.has_replacement = nil
		device.save
		redirect_to replacements_list_devices_path
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
		session[:changed_params] = nil
		session[:device_old_state] = @device
		device_log = Device.find(session[:device_old_state])
		if @device.changed?		
			session[:changed_params] = @device.title_was
		end
		if @device.update_attributes(params[:device])
			
			redirect_to sozdat_log_path
				# ^ Эквивалентно ли render "show"?
		else
				
			render "edit"
		end
	end
	
	def show
		@device = Device.find(params[:id])
	end

=begin
	def delete
  	@speech = Speech.find(params[:id])
  end
=end
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
	
	def make_replacement_pair
		replacement = Device.find(params[:id])
		device = Device.find(session[:current_device_id])
		device.replacement_id = replacement.id
		device.has_replacement = true
		device.save
		session[:current_device_id] = nil
		redirect_to replacements_list_devices_path
	end
	
	private
	
	def sort_column
		Device.column_names.include?(params[:sort]) ? params[:sort] : "title"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
end