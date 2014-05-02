class ProductordersController < ApplicationController
def index
    @productorders = Productorder.all
    @productorders = Productorder.order(params[:sort])
  end

  def show
   	@productorder = Productorder.find(params[:id])
	end

  
  def new
   	@productorder = Productorder.new
	end

  def edit
    @order = Order.find(params[:order_id])
   	@productorder = Productorder.find(params[:id])
  end

  #def create
   #	@productorder = Productorder.new(params[:productorder])
    #if @productorder.save
     #	redirect_to @productorder, notice: 'Nombre de producto creado exitosamente.' 
    #else
     # render action: "new" 
    #end
  #end

  def create
    @order = Order.find(params[:order_id])
    @productorder = @order.productorders.create(params[:productorder])
    redirect_to order_path(@order)
  end

  def update
    @order = Order.find(params[:order_id])
    @productorder = Productorder.find(params[:id])
  	if @productorder.update_attributes(params[:productorder])
      redirect_to @productorder.order_id, notice: 'Producto de Orden Actualizado exitosamente.'

    else
      render action: "edit" 
    end
    #@productorder = Productorder.find(params[:id])
    #if @productorder.update_attributes(params[:productorder])
	   # redirect_to @productorder, notice: 'Nombre de Producto Actualizado exitosamente.'

    #else
    #	render action: "edit" 
    #end
  end

  
  def destroy
    @productorder = Productorder.find(params[:id])
    @productorder.destroy
    redirect_to productorders_url 
  end


  def agregar_producto_pedido
    @productorder = Productorder.find(params[:id])
    @productorder.order_id = params[:order_id]
    @productorder.state = false
    @productorder.save
    @order = Order.find(params[:order_id])
    @order.save
    redirect_to order_path(@order)
  end

  def eliminar_producto_pedido
    @productorder = Productorder.find(params[:id])
    @productorder.order_id = nil
    @productorder.save
    @order = Order.find(params[:order_id])
    @order.save
    redirect_to order_path(@order)
  end
end
