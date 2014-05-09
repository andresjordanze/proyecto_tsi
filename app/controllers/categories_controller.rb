class CategoriesController < ApplicationController

	def index
    @categories = Category.all
    @categories = Category.order(params[:sort])
  	end

  	def show
    	@category = Category.find(params[:id])
	end

  
  	def new
    	@category = Category.new
	end

  
  	def edit
    	@category = Category.find(params[:id])
  	end

  	def create
    	@category = Category.new(params[:category])
      if @category.save
       	redirect_to @category, notice: 'Categoria Creada exitosamente.' 
      else
        render action: "new" 
      end
  	end

  def update
  	@category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
	    redirect_to @category, notice: 'Categoria Actualizada exitosamente.'
    else
    	render action: "edit" 
    end
  end

  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url 
  end

  def search
    @categories = buscar(params[:name])
    render 'index'
  end

  def buscar(nombre)
      items = Array.new 
      aux = Category.all
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
