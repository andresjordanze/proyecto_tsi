class Sale < ActiveRecord::Base
	has_many :subproducts
	attr_accessible :price, :check_number, :client_name, :created_at, :updated_at, :nit

	#VALID_NAME_REGEX = /^[a-zA-Z0-9-.]+$/
	

	validates :client_name, presence: {:message => "Usted debe ingresar el nombre del cliente"}	
	validates :client_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo Letras Permitidas" }
    validates :nit, presence: {:message => "Usted debe ingresar el NIT"}
	validates :check_number, presence: {:message => "Usted debe ingresar el numero de factura"}	
	validates :nit, numericality: {:message => "El valor de NIT debe ser numerico"}

	validates :check_number, numericality: {:message => "El valor del numero de factura debe ser numerico"}

	def correspondeACliente(nombre)
		texto = self.client_name.split
		texto.each do |palabra|
			if palabra.downcase.include?(nombre.downcase)
				return true
			end
		end
		false
	end

	def tieneAlProducto(nombre)
		self.subproducts.each do |subproducto|
			if subproducto.product.name.downcase.include?(nombre.downcase)
				return true
			end
		end
		false
	end

	def resetearSubproductos
		self.subproducts.each do |subproducto|
			subproducto.cancelar_venta
		end
	end
end
