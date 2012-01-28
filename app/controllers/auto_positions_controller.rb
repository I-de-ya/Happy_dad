# coding: utf-8
class AutoPositionsController < ApplicationController

  def index
  	@auto_positions = AutoPosition.all
  end

  def import_from_csv
    require 'csv'
    if request.post? && params[:dump][:file].present?
      infile = params[:dump][:file].read().force_encoding("UTF-8")
      n = 0
      
      CSV.parse(infile) do |row|
        n += 1
        next if row.join.blank?
        auto_position = AutoPosition.new
        auto_position.automation_area = row[0]
        auto_position.technological_unit = row[1]
        auto_position.project_specification = row[2]
        auto_position.title = row[3]
        auto_position.function = row[4]
        auto_position.parameter_name = row[5]
        auto_position.parameter_range = row[6]
        auto_position.parameter_measurement_units = row[7]
        auto_position.device_id = row[11]
        auto_position.save
      end
    end
    params[:dump][:file] = nil
    flash.now[:message] = "Файл успешно импортирован, в базу добавлено #{n} записей."
    redirect_to auto_positions_path  
    end


=begin
  def import_from_csv
  	require 'csv'
  	CSV.foreach('/home/slavcha/Dropbox/New folder/Happy dad (старый)/документация/Заполнение БД/Import_positions.csv', col_sep: ",", encoding:"UTF-8") do |row|
  		AutoPosition.create(:automation_area => row[0], :technological_unit => row[1], :project_specification => row[2], :title => row[3], :function => row[4], :parameter_name => row[5], :parameter_range => row[6], :parameter_measurement_units => row[7], :device_id => row[11])
  	end
  	redirect_to auto_positions_path
  end
=end 

  def import
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

end
