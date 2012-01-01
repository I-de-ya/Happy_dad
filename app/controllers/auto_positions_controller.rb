# coding: utf-8
class AutoPositionsController < ApplicationController

  def index
  	@auto_positions = AutoPosition.all
  end

  def import_from_csv
  	require 'csv'
  	CSV.open('/home/innerwhisper/Рабочий стол/Import_positions.csv', 'r').each do |row|
  		AutoPosition.create(:automation_area => row[0], :technological_unit => row[1], :project_specification => row[2], :title => row[3], :function => row[4], :parameter_name => row[5], :parameter_range => row[6], :parameter_measurement_units => row[7], :device_id => row[11])
  	end
  	redirect_to auto_positions_path
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
