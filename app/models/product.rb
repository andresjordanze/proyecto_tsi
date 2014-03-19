class Product < ActiveRecord::Base
	has_many :subproducts, dependent: :destroy
	attr_accessible :name, :detail, :description, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at

	after_create :crear_subproductos

	def crear_subproductos
	   	1.upto(quantity) do |num|
    		subproducts.create("code" => general_code+"-#{num}")
      	end
    end

end
