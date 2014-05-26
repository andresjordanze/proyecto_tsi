class Outflow < ActiveRecord::Base
	attr_accessible :sale_id, :total_price, :subproducts
	has_many :subproducts, dependent: :destroy
	
	def registrar(sale_id)
		@sale = Sale.find(sale_id.to_i)
      	@subproducts = Subproduct.where("sale_id = :sale_id", {sale_id: @sale.id}).to_a

      	self.total_price = @sale.price
      	self.save
  	end
end
