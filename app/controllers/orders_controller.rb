class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
	end

	def new	
		@order = Order.new
	end
  
	def index
		@orders = Order.order('created_at DESC').all
	end

	def mostrar
		@order = Order.find(params[:id]) 
	end

	def create
		@order = Order.new
		@order.id = @order.id
		@order.numero_pedido = @order.id
	    @order.estado = params[:estado]
	    @order.provider = params[:provider]
	    @order.ingresado = params[:ingresado]
	    if @order.save
	      redirect_to '/orders/' + @order.id.to_s
	    else
	      flash[:message] = "Verifique los Campos Marcados"
	      render :action => 'new'
	    end
  	end

=begin

		if Order.all != []
			@orders = Order.all
			@orders.each do |order|
				if order.id == params[:order][:id] && order.nombre_producto == params[:order][:nombre_producto] && order.ingresado == true
					@order = order
				else
					if order.id == params[:order][:id] && order.nombre_producto == params[:order][:nombre_producto] && order.ingresado == false
						order.cantidad += params[:order][:cantidad].to_i
						@order = order
					else
						@order = Order.new(params[:order])
						@order.estado = "pendiente"
						@order.ingresado = false
					end
				end
			end
			if @order.save	&& @order.ingresado == false
				redirect_to @order, notice: 'Pedido registrado.' 
			else
				redirect_to @order, notice: 'Opcion invalida, este pedido ya fue ingresado!' 
			end			
		else
			@order = Order.new(params[:order])
			@order.estado = "pendiente"
			@order.ingresado = false
			if @order.save		
				redirect_to @order, notice: 'Pedido registrado.' 
			else
				render action: 'new'
			end
		end

	end
	
=end


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

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		order = params[:order]
		@order.created_at = Date.new order["created_at(1i)"].to_i, order["created_at(2i)"].to_i, order["created_at(3i)"].to_i
		if @order.update_attributes(params[:order])
			@order.save
			flash[:success] = "Pedido registrado exitosamente!"
			#redirect_to @order			
			redirect_to '/orders/'
		else
			render 'edit'
		end
	end

	def guardar_proveedor
		@order = Order.find(params[:id])
		@order.provider = params[:provider]
		@order.save
		redirect_to '/orders/'
	end

end
