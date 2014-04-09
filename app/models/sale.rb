class Sale < ActiveRecord::Base
	has_many :subproducts
	attr_accessible :price, :check_number, :client_name, :created_at, :updated_at, :nit


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
