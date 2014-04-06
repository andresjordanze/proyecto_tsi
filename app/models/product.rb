class Product < ActiveRecord::Base
	has_many :subproducts, dependent: :destroy
	attr_accessible :name, :detail, :description, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at,:photo
	belongs_to :sale


	has_attached_file :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	after_create :crear_subproducto

	def crear_subproducto
		subproducts.create("code" => general_code+"-1")
	end


end
