class Order < ActiveRecord::Base
	attr_accessible :numero_pedido, :provider, :estado, :ingresado
	has_many :providers
	has_many :productorders	
	
	validates :numero_pedido, uniqueness: {case_sensitive: false, :message => "El numero de pedido ya existe"}	
	validates :numero_pedido, presence: {:message => "Es un campo obligatorio"}	
	validates :numero_pedido, numericality: {:message => "Este campo debe ser de tipo numerico"}


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
