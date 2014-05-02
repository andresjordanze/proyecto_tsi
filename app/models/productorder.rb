class Productorder < ActiveRecord::Base
	belongs_to :order
	attr_accessible :name, :quantity, :code, :state
	#validates :name, presence: {:message => "Usted debe ingresar el nombre del producto"}	
	#validates :name, uniqueness: {case_sensitive: false, :message => "El nombre de producto ya existe"}
	#validates :name, length: {minimum: 2, maximum: 20, :message => "El Nombre del producto debe tener minimo 2 y maximo 20 caracteres"}


	def cancelar_pedido
  		self.state = nil
  		self.order_id = nil      
    end
end
