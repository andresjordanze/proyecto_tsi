class Productorder < ActiveRecord::Base
	belongs_to :order
	has_many :productnames
	attr_accessible :nombre_producto, :quantity, :code, :ingresado, :description

	validates :quantity, presence: {:message => "Es un campo obligatorio"}
	validates :quantity, numericality: {:message => "La cantidad debe ser numerico"}
	validates :quantity, numericality: {greater_than: 0, :message => "La cantidad debe ser mayor a 0" }
	
	validates :code, presence: {:message => "Es un campo obligatorio"}
	validates :code, length: {minimum: 5, maximum: 10, :message => "El Detalle debe tener minimo 5 y maximo 10 caracteres"}

	def cancelar_pedido
  		self.state = nil
  		self.order_id = nil      
    end
end
