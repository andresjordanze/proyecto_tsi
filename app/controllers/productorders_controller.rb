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
   	@productorder = Productorder.new(params[:productorder])
    if @productorder.save
     	redirect_to @productorder, notice: 'Nombre de producto creado exitosamente.' 
    else
      render action: "new" 
    end
  end

  def update
  	@productorder = Productorder.find(params[:id])
    if @productorder.update_attributes(params[:productorder])
	    redirect_to @productorder, notice: 'Nombre de Producto Actualizado exitosamente.'

    else
    	render action: "edit" 
    end
  end

  
  def destroy
    @productorder = Productorder.find(params[:id])
    @productorder.destroy
    redirect_to productorders_url 
  end
end
