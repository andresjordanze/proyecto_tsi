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

  def search_between_dates
  	initial_date = Date.parse(params[:initial_date])
    ending_date = Date.parse(params[:ending_date])
    @outflows = Outflow.where(:created_at => initial_date.beginning_of_day..ending_date.end_of_day)
    render 'report'
  end

    def report_search
    end


end
