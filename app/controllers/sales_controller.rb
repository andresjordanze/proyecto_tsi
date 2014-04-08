class SalesController < ApplicationController

	def index
		@sales = Sale.all		
	end

	def show
		@sale = Sale.find(params[:id])
	end

	def new
		@sale = Sale.new
	end

	def create
		@sale = Sale.new(params[:sale])
		@sale.price = 0
		@sale.save		
		redirect_to @sale
	end

	def edit
		@sale = Sale.find(params[:id])
	end

	def update
		@sale = Sale.find(params[:id])
		if @sale.update_attributes(params[:sale])
			flash[:success] = "Venta Actualizada"
			redirect_to @sale
		else
			render 'edit'
		end
	end

	def destroy
		@sale = Sale.find(params[:id])
		@sale.destroy
		redirect_to sales_url
	end

end
