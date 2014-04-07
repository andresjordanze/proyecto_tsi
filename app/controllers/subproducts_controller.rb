class SubproductsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@subproduct = @product.subproducts.create(params[:subproduct].permit(:code))
		redirect_to product_path(@product)
  	end

  	def destroy
  		@product = Product.find(params[:product_id])
  		@subproduct = @product.subproducts.find(params[:id])
  		@subproduct.destroy
  		redirect_to product_path(@product)    	
  	end

    def index
      @subproducts = Subproduct.all   
    end
end
