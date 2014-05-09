class BrandsController < ApplicationController

	def index
    @brands = Brand.all
    @brands = Brand.order(params[:sort])
  end

  def show
   	@brand = Brand.find(params[:id])
	end

  
  def new
   	@brand = Brand.new
	end

  def edit
   	@brand = Brand.find(params[:id])
  end

  def create
   	@brand = Brand.new(params[:brand])
    if @brand.save
     	redirect_to @brand, notice: 'Categoria Creada exitosamente.' 
    else
      render action: "new" 
    end
  end

  def update
  	@brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
	    redirect_to @brand, notice: 'Marca Actualizada exitosamente.'

    else
    	render action: "edit" 
    end
  end

  
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_url 
  end

  def search
    @brands = buscar(params[:name])
    render 'index'
  end

  def buscar(nombre)
      items = Array.new 
      aux = Brand.all
      if nombre != "" && nombre != nil
          aux.each do |item|
          if (item.correspondeAnombre(nombre))
              items.push(item)
          end
        end
      else
          items = aux
      end
      return items
    end
end
