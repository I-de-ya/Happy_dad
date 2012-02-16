# coding: utf-8
class ReplacementPairsController < ApplicationController
	
	def index
		@pairs = ReplacementPair.where(:replacement_order_id => nil)

		respond_to do |format|
			format.html
			format.xls { send_data @devices.to_xls(:columns => [{:auto_position => [:automation_area,:technological_unit,:title]},:input_range,:input_measurement_units,:output_range,:output_measurement_units,:device_type,:model,:serial_number, {:replacement => [:input_range,:input_measurement_units,:output_range,:output_measurement_units,:device_type,:model,:serial_number,:form_of_mr,:prev_mr_date,:next_mr_date]}], :headers => ["С позиции", "На позицию"]), :filename => 'Замены приборов.xls'}
		end
	end

	def destroy
		@pair = ReplacementPair.find(params[:id]).destroy
  		flash[:success] = "Пара была удалена."
  		redirect_to replacement_orders_path
	end
end