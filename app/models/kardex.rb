class Kardex < ActiveRecord::Base
	belongs_to :product
	attr_accessible :detail, :date, :income, :output
end
