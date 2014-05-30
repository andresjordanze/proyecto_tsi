class ProductsalesController < ApplicationController

	def new
		@productsale = Productsale.new
	end

	def create
		@subproduct = Subproduct.find(params[:productsale][:subproduct_id].to_i)
		@product = Product.find(@subproduct.product_id)
		@product.quantity -= 1
		@product.save
		@sale = Sale.find(params[:sale_id])
		@sale.price += params[:productsale][:price].to_f
		@sale.save 
		@productsale = Productsale.new
		@productsale.name = @subproduct.name
		@productsale.code = @subproduct.code
		@productsale.sale_id = params[:sale_id]
		@productsale.price = params[:productsale][:price]
		@subproduct.available = false
		@subproduct.save
		if @productsale.save
			flash[:success] = "Producto agregado a venta exitosamente."
			redirect_to "/sales/"+@productsale.sale_id.to_s
		else

		end
	end

end
