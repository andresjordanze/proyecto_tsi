class Sale < ActiveRecord::Base
	has_many :products
	attr_accessible :price, :detail, :check_number, :client_name, :created_at, :updated_at
end
