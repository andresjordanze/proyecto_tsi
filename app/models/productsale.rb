class Productsale < ActiveRecord::Base
	attr_accessible :name, :code, :price, :sale_id

	belongs_to :sale

	def guardar(sub,sale)
		self.name = @sub.name
		self.code = @sub.code
		self.sale_id = sale
	end
end
