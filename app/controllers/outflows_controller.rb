class OutflowsController < ApplicationController
  def show
  	@outflow = Outflow.find(params[:id])
  end
  
  def index
  	@outflows = Outflow.all		
  end

  def new
    @outflow = Outflow.new 
  end

end
