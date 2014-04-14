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

	def search
		@orders = buscar(params[:provider])
		render 'index'
	end

	def buscar(proveedor)
    	items = Array.new	
    	aux = Order.all
    	if proveedor != "" && proveedor != nil
      		aux.each do |item|
        	if (item.correspondeAproveedor(proveedor))
          		items.push(item)
        	end
      	end
    	else
      		items = aux
    	end
    	return items
  	end



	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to orders_url
	end

end
