class ProductsController < ApplicationController
	def index
		@products = Product.all		
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		@product.home = false
		@product.save		
		redirect_to @product
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			flash[:success] = "Producto Actualizado"
			redirect_to @product
		else
			render 'edit'
		end
	end

	def add_to_home
		@product = Product.find(params[:id])
		@product.home = true
		@product.save
	end

	def delete_from_home
		@product = Product.find(params[:id])
		@product.home = false
		@product.save
		redirect_to products_url
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_url
	end
end
