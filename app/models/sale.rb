class Sale < ActiveRecord::Base
	has_many :products, :subproducts
	attr_accessible :price, :detail, :check_number, :client_name, :created_at, :updated_at
end
