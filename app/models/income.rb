class Income < ActiveRecord::Base
	attr_accessible :id_order, :product_name, :quantity, :description, :price, :total_price, :code

	def registrar(productorder)
      	@productname = Productname.find(productorder.productname_id.to_i)
      	self.code = @productname.code
      	self.product_name = @productname.name
      	self.description = @productname.description
      	self.quantity = productorder.quantity
      	self.id_order = productorder.order_id
      	self.price = productorder.price
      	self.total_price = productorder.total_price
  	end
end
