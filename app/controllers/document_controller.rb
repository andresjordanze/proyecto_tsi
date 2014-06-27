class DocumentController < ApplicationController

	def index
    @documents = Document.all
  end

  def show
    	@document = Document.find(params[:id])
	end

  
  def new
    	@document = Document.new
	end

 	def create
    @document = Document.new(params[:archive])
      if @document.save
         flash[:success] = 'Categoria Creada exitosamente.' 
       	redirect_to @document
      else
        render action: "new" 
      end
  	end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_url 
  end
end
