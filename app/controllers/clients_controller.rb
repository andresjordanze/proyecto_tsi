class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:message] = "Cliente registrado!"
      redirect_to :controller => :clients, :action => "index"
    else
      render :action => 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:success] = "Cliente modificado!"
      redirect_to :controller => :clients, :action => "index"
    else
      render :action => 'edit'
    end
  end

  def index
    @clients = Client.all
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:danger] = "Cliente eliminado!"
    redirect_to :controller => :clients, :action => "index"
  end

end
