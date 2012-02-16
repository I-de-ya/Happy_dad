class ReplacementOrdersController < ApplicationController

	def index
		@orders = ReplacementOrder.all
	end

	def new
		@order = ReplacementOrder.new
	end

	def create
		@order = ReplacementOrder.new(params[:replacement_order])
		@order.add_raplacement_pairs_to_order(ReplacementPair.where(:replacement_order_id => nil))
		@order.save
		redirect_to replacement_orders_path
	end

	def show
		@order = ReplacementOrder.find(params[:id])
		@pairs = @order.replacement_pairs.all
	end
	
	def destroy
		@location = Location.find(params[:id]).destroy

		redirect_to locations_path
	end

end
