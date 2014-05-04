class ProductnamesController < ApplicationController
	def index
    @productnames = Productname.all
    #@productnames = Productname.order(params[:sort])
  end

  def show
   	@productname = Productname.find(params[:id])
	end

  
  def new
   	@productname = Productname.new
	end

  def edit
   	@productname = Productname.find(params[:id])
  end

  def create
   	@productname = Productname.new(params[:productname])
    if @productname.save
     	redirect_to @productname, notice: 'Nombre de producto creado exitosamente.' 
    else
      render action: "new" 
    end
  end

  def update
  	@productname = Productname.find(params[:id])
    if @productname.update_attributes(params[:productname])
	    redirect_to @productname, notice: 'Nombre Actualizado exitosamente.'
    else
    	render action: "edit" 
    end
  end

  
  def destroy
    @productname = Productname.find(params[:id])
    @productname.destroy
    redirect_to productnames_url 
  end
end
