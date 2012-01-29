# coding: utf-8
class DevicesController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@page = params[:page]
		@device = Device.attribute_names - ["id", "created_at","updated_at","has_replacement"]
		@names = ["Название", "Статус", "Местоположение", "Тип СИ", "Инвентарный номер", "Серийный номер", "mr_unit", "next_mr_date", "prev_mr_date", "replace_param", "Место автоматизации", "input_range", "input_measurement_units", "output_range", "output_measurement_units", "model", "Уникальный номер в АСОМИ", "year_of_production", "beginning_operation_year", "changeover_input_range", "changeover_input_measurement_units", "passport", "passport_store_place", "passport_electronic_version", "tech_description", "tech_description_store_place", "tech_description_electronic_version", "user_manual", "user_manual_store_place", "user_manual_electronic_version", "Золото", "Серебро", "Платина", "PG_metals", "subreport_number", "ENS_number", "Комментарии", "form_of_mr"]
		attributes = [ @names,@device ]
		@attributes = Hash[*attributes.transpose.flatten]

		@attr = params[:qwerty]
		@search = params[:search]
		@regsearch = /\A[\s\w\"\(\)А-Яа-я\-.]*#{@search}[\s\w\"\(\)А-Яа-я\-.]*\z/i
		if @search == nil
			@devices = Device.where('next_mr_date NOT ?', nil).paginate(:page => params[:page], :per_page => 10).order(sort_column + " " + sort_direction)
		else
			@devices = Device.order(sort_column + " " + sort_direction)
		end
	end

	def alldevices
		@page = params[:page]
		@device = Device.attribute_names - ["id", "created_at","updated_at"]
		@attr = params[:qwerty]
		@search = params[:search]
		@regsearch = /\A[\s\w\"\(\)А-Яа-я\-.]*#{@search}[\s\w\"\(\)А-Яа-я\-.]*\z/i
		if @search == nil
			@devices = Device.paginate(:page => params[:page], :per_page => 10).order(sort_column + " " + sort_direction)
		else
			@devices = Device.order(sort_column + " " + sort_direction)
		end
	end
		
	
	def replacements_list
		@devices = Device.where(:has_replacement=>true)
	
		respond_to do |format|
			format.html
			format.xls { send_data @devices.to_xls(:columns => [{:auto_position => [:automation_area,:technological_unit,:title]},:input_range,:input_measurement_units,:output_range,:output_measurement_units,:device_type,:model,:serial_number, {:replacement => [:input_range,:input_measurement_units,:output_range,:output_measurement_units,:device_type,:model,:serial_number,:form_of_mr,:prev_mr_date,:next_mr_date]}], :headers => ["С позиции", "На позицию"]), :filename => 'Замены приборов.xls'}
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
		@device.attributes = params[:device]
		
		session[:changed_device] = @device.id
		if @device.changed?
				session[:changes] = @device.changes

			if @device.save
				redirect_to :controller=>'logs', :action => 'sozdat'
			else
				render :action => "edit"
			end
		else
			redirect_to root_path
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

	def log
		@device = Device.find(params[:id])
	end
	
	def import
	end
	  
	def import_from_csv
		require 'csv'
		if request.post? && params[:dump][:file_path].present?
			file_path = params[:dump][:file_path]
			n = 0
			
			CSV.open(file_path, "rb:UTF-8", {:col_sep => ";"}).each do |row|
				n += 1
				device = Device.new
				device.device_type = row[0]
  				device.title = row[2]
  				device.serial_number = row[3]
  				device.form_of_mr = row[4]
  				device.prev_mr_date = row[5]
  				device.next_mr_date = row[6]
  				device.comment = row[9]
  				device.uniq_number_in_ASOMI = row[10]
				device.save
				@first_id ||= device.id if n == 1
			end
		end
		params[:dump][:file_path] = nil
		flash[:message] = "Файл успешно импортирован, в базу добавлено #{n} записей. id первого прибора #{@first_id}"
		redirect_to devices_path
  	end


	private
	
	def sort_column
		Device.column_names.include?(params[:sort]) ? params[:sort] : "next_mr_date"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
end
