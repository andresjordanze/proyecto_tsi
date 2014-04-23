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
		@technical_service.problems = "Problemas no registrados aun."
		@technical_service.repairs = "Reparaciones no realizadas aun."
		@technical_service.status = "Recibido"
		if @technical_service.save		
			redirect_to @technical_service, notice: 'Servicio tecnico registrado correctamente.' 
		else
			render action: 'new'
		end
	end

	def edit
		@technical_service = TechnicalService.find(params[:id])
	end

	def update
		@technical_service = TechnicalService.find(params[:id])
		if @technical_service.update_attributes(params[:technical_service])
			@technical_service.save
			flash[:success] = "Servicio Tecnico Actualizado"
			redirect_to @technical_service			
		else
			render 'edit'
		end
	end

end
