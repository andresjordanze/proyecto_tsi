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
   	@productorder = Productorder.find(params[:id])
  end

  def create
    @control = false
    @order = Order.find(params[:order_id])
    @productorders = Productorder.where("order_id = :order_id", {order_id: @order.numero_pedido}).to_a
    @productorders.each do |productorder|
      if productorder.code == params[:productorder][:code]
        @control = true
      end
    end
    if @control == false
      @productorder = @order.productorders.create(params[:productorder])
      @productorder.ingresado = false
      @productorder.order_id = @order.numero_pedido
      @productorder.save
      redirect_to '/orders/'+@order.numero_pedido
    else
      flash[:danger] = 'No se registro el producto, porque ya existe en pedido'
      redirect_to '/orders/'+@order.numero_pedido
    end
  end

  def update
    @productorder = Productorder.find(params[:id])
  	if @productorder.update_attributes(params[:productorder])
      flash[:success] = "Producto de pedido modificado!"
      redirect_to @productorder
    else
      render action: "edit" 
    end
  end

  
  def destroy
    @productorder = Productorder.find(params[:id])
    @productorder.destroy
    redirect_to productorders_url 
  end


  def agregar_producto_pedido
    @productorder = Productorder.find(params[:id])
    @productorder.order_id = params[:order_id]
    @productorder.ingresado = false
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
