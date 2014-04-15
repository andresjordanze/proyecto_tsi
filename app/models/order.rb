class Order < ActiveRecord::Base
	attr_accessible :cantidad, :nombre_producto, :numero_pedido, :provider, :estado
	has_many :providers
	
	validates :nombre_producto, length: {minimum: 2, maximum: 20, :message => "El nombre del producto debe tener minimo 2 y maximo 20 caracteres"}
	validates :nombre_producto, presence: {:message => "Es un campo obligatorio"}
	
	validates :numero_pedido, presence: {:message => "Es un campo obligatorio"}	
	validates :numero_pedido, numericality: {:message => "Este campo debe ser de tipo numerico"}
	
	validates :cantidad, presence: {:message => "Es un campo obligatorio"}
	validates :cantidad, numericality: {:message => "La cantidad debe ser numerico"}
	validates :cantidad, numericality: {greater_than: 0, :message => "La cantidad debe ser mayor a 0" }
	
	validates :provider, presence: {:message => "Es un campo obligatorio"}

	def correspondeAproveedor(proveedor)
    	parametros = proveedor.split(' ')
    	parametros.each do |parametro|
      	if self.provider.downcase.include?(parametro.downcase)
	        return true
    	  end
    	end
    	false
  	end

end
