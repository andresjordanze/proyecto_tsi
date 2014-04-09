class Subproduct < ActiveRecord::Base
	belongs_to :product
  	belongs_to :sale
  	attr_accessible :code, :sale_id, :available

  	def cancelar_venta
  		self.available = true
  		self.sale_id = nil      
    end

  	before_create do
		self.available = true
	end
end
