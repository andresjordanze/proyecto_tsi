class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
	end

	def new	
		@order = Order.new
	end
  
	def index
		@orders = Order.all		
	end

	def create
		@order = Order.new(params[:order])
		@order.estado = "pendiente"
		if @order.save		
			redirect_to @order, notice: 'Pedido registrado.' 
		else
			render action: 'new'
		end
	end
	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to orders_url
	end

end
