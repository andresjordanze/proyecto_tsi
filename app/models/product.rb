class Product < ActiveRecord::Base
<<<<<<< HEAD
	attr_accessible :name, :detail, :description, :code, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at,:photo
	has_attached_file :photo
 	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
=======
	has_many :subproducts, dependent: :destroy
	attr_accessible :name, :detail, :description, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at

	after_create :crear_subproductos

	def crear_subproductos
	   	1.upto(quantity) do |num|
    		subproducts.create("code" => general_code+"-#{num}")
      	end
    end

>>>>>>> b09bcd00b365915f6f912066c0f949a405c1cb18
end
