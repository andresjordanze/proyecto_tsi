class OrdersController < ApplicationController
	def show
		@order = Order.where("numero_pedido = :numero_pedido", {numero_pedido: params[:id]}).to_a.at(0)
	end

	def new	
		@order = Order.new
	end
  
	def index
		@orders = Order.all		
	end

	def create
		@order = Order.new (params[:order])
	    @order.estado =  'Pendiente'
	    @order.ingresado = false
	    if @order.save
	      flash[:message] = "Pedido Registrado!"
	      redirect_to '/orders/' + @order.numero_pedido
	    else
	      flash[:message] = "Verifique los Campos Marcados"
	      render :action => 'new'
	    end
  	end

=begin

		if Order.all != []
			@orders = Order.all
			@orders.each do |order|
				if order.numero_pedido == params[:order][:numero_pedido] && order.nombre_producto == params[:order][:nombre_producto] && order.ingresado == true
					@order = order
				else
					if order.numero_pedido == params[:order][:numero_pedido] && order.nombre_producto == params[:order][:nombre_producto] && order.ingresado == false
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
		@productorders = Productorder.where("order_id = :order_id", {order_id: @order.id}).to_a
		@productorders.each do |productorder|
			productorder.order_id = params[:order][:numero_pedido]
			productorder.save
		end
		if @order.update_attributes(params[:order])
			@order.save
			flash[:success] = "Orden Actualizada"
			#redirect_to @order			
			redirect_to '/orders/' + @order.numero_pedido
		else
			render 'edit'
		end
	end

end
