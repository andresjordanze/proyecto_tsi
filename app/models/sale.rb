class Sale < ActiveRecord::Base
	attr_accessible :price, :detail, :check_number, :client_name, :created_at, :updated_at
end
