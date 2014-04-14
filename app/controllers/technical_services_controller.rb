class TechnicalServicesController < ApplicationController
	def index
		@technical_services = TechnicalService.all		
	end

	def show
		@technical_service= TechnicalService.find(params[:id])
	end

	def new
		@technical_service= TechnicalService.new
	end

	def create
		@technical_service= TechnicalService.new(params[:technical_service])
		@technical_service.status = "Recidido"
		if @technical_service.save		
			redirect_to @technical_service, notice: 'Servicio tecnico registrado correctamente.' 
		else
			render action: 'new'
		end
	end

end
