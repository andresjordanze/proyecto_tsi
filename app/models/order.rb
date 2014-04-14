class Order < ActiveRecord::Base
	attr_accessible :cantidad, :nombre_producto, :numero_pedido, :provider, :estado
	has_many :providers
	validates :numero_pedido, presence: {:message => "Es un campo obligatorio"}	
	validates :nombre_producto, presence: {:message => "Es un campo obligatorio"}
	validates :cantidad, presence: {:message => "Es un campo obligatorio"}
	validates :provider, presence: {:message => "Es un campo obligatorio"}
end
