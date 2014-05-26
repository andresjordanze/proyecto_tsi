class Income < ActiveRecord::Base
	attr_accessible :id_order, :product_name, :quantity, :description, :price, :total_price, :code

	def registrar(prod_id)
      	@productname = Productorder.find(prod_id.to_i)
      	self.code = @productname.code
      	self.product_name = @productname.nombre_producto
      	self.description = @productname.description
      	self.quantity = @productname.quantity
      	self.id_order = @productname.order_id
      	self.price = @productname.price
      	self.total_price = @productname.total_price
      	self.save
  	end
end
