class TechnicalServicesController < ApplicationController
	def index
		@technical_services = TechnicalService.all		
	end

	def show
		@technical_service= TechnicalService.find(params[:id])
	end

	def servicios
		@technical_services = TechnicalService.paginate(:per_page => 5, :page => params[:page])
	end

	 def search_between_dates
      initial_date = Date.parse(params[:initial_date])
      ending_date = Date.parse(params[:ending_date])
      @technical_services = TechnicalService.where(:created_at => initial_date.beginning_of_day..ending_date.end_of_day)
      render 'report'
    end

    def report
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
			flash[:success] = 'Servicio tecnico registrado correctamente.' 
			redirect_to @technical_service
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

	def search
		#@value = params[:value]
    	#@technical_services = buscar(@value)
		#@technical_services = TechnicalService.where("client like ? or id like ?", "%#{params[:value]}%", "%#{params[:value]}%")#.paginate(:per_page => 6, :page => params[:page])
    	@technical_services = TechnicalService.where("id = :id", {id: params[:name]}).to_a
    	#render 'index'
  	end

  	def buscar(valor)
      items = Array.new 
      aux = TechnicalService.all
      if valor != "" && valor != nil
          aux.each do |item|
          if (item.correspondeACliente(valor) || item.id == valor.to_i)
              items.push(item)
          end
        end
      else
          items = []
      end
      return items
    end

end
