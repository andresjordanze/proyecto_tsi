class IncomesController < ApplicationController
  def show
  	@income = Income.find(params[:id])
  end
  
  def index
  	@products = Income.all		
  end

  def create
    	@product = Product.find(params[:product_id])
    	@income = @product.incomes.create(params[:income].permit(:fecha))
    	redirect_to product_path(@product)
  end

end
