class IncomesController < ApplicationController
  def show
  	@income = Income.find(params[:id])
  end
  
  def index
  	@incomes = Income.all		
  end

  def new
    @income = Income.new  
  end

end
