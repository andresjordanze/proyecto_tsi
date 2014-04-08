class Sale < ActiveRecord::Base
	has_many :subproducts
	attr_accessible :price, :check_number, :client_name, :created_at, :updated_at, :nit
end
