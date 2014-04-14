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

  public 
  def self.create(nombre_producto, cantidad, numero_pedido)
      @income=Income.new
      @income.nombre_producto=nombre_producto
      @income.cantidad=cantidad
      @income.numero_pedido=numero_pedido
      @income.save
    	redirect_to income_path(@income)
  end

end
