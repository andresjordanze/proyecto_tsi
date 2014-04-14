class Income < ActiveRecord::Base
	attr_accessible :id_order, :product_name, :quantity

	def registrar(quantity, order_id, product_name)
		self.quantity = quantity
		self.id_order = order_id
		self.product_name = product_name
		self.save
	end
end
