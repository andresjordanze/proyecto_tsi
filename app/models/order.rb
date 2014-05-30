class Order < ActiveRecord::Base
	attr_accessible :numero_pedido, :provider_id, :estado, :ingresado
	
  belongs_to :providers
  
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
