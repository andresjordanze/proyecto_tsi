class Order < ActiveRecord::Base
	attr_accessible :cantidad, :nombre_producto, :numero_pedido, :provider, :estado
	has_many :providers
	validates :numero_pedido, presence: {:message => "Es un campo obligatorio"}	
	validates :nombre_producto, presence: {:message => "Es un campo obligatorio"}
	validates :cantidad, presence: {:message => "Es un campo obligatorio"}
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
