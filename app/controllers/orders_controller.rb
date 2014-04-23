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
		if Order.all != []
			@orders = Order.all
			@orders.each do |order|
				if order.numero_pedido == params[:order][:numero_pedido] && order.nombre_producto == params[:order][:nombre_producto]
					order.cantidad += params[:order][:cantidad].to_i
					@order = order
				else
					@order = Order.new(params[:order])
					@order.estado = "pendiente"
				end	
			end
			if @order.save		
				redirect_to @order, notice: 'Pedido registrado.' 
			else
				render action: 'new'
			end
		else
			@order = Order.new(params[:order])
			@order.estado = "pendiente"
			if @order.save		
				redirect_to @order, notice: 'Pedido registrado.' 
			else
				render action: 'new'
			end
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
