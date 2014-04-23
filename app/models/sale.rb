class Sale < ActiveRecord::Base
	has_many :subproducts
	attr_accessible :price, :check_number, :client_name, :created_at, :updated_at, :nit

	#VALID_NAME_REGEX = /^[a-zA-Z0-9-.]+$/
	

	validates :client_name, presence: {:message => "Nombre de cliente no puede estar vacio"}	
	validates :client_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo Letras Permitidas" }
    validates :client_name, length: {minimum: 3, maximum: 20, :message => "El Nombre del cliente debe tener minimo 3 caracteres"}

    validates :nit, presence: {:message => "Usted debe ingresar el NIT"}
    validates :nit, numericality: {:message => "El valor de NIT debe ser numerico"}
    validates :nit, length: {minimum: 7, maximum: 12, :message => "El numero de NIT debe tener minimo 7 caracter"}
    validates :nit, numericality: {greater_than: 0, :message => "El numero de nit no puede ser un numero negativo" }
	
	validates :check_number, presence: {:message => "Usted debe ingresar el numero de factura"}	
	validates :check_number, numericality: {:message => "El valor del numero de factura debe ser numerico"}
	validates :check_number, length: {minimum: 4, maximum: 12, :message => "El numero de factura debe tener minimo 4 caracteres"}
	validates :check_number, numericality: {greater_than: 0, :message => "El numero de factura no puede ser mayor a 0" }
	
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
