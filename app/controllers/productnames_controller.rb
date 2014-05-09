class ProductnamesController < ApplicationController
	def index
    @productnames = Productname.all
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

  def search
    @productnames = buscar(params[:name])
    render 'index'
  end

  def buscar(nombre)
      items = Array.new 
      aux = Productname.all
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
