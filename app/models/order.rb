class Order < ActiveRecord::Base
	attr_accessible :numero_pedido, :provider, :estado, :ingresado
	has_many :providers
	has_many :productorders	

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
