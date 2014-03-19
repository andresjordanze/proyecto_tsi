class Product < ActiveRecord::Base
	attr_accessible :name, :detail, :description, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at
end
