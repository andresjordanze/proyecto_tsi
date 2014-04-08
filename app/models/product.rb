class Product < ActiveRecord::Base
	has_many :subproducts, dependent: :destroy
	attr_accessible :name, :detail, :description, :increase, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at,:photo
	belongs_to :sale
	has_many :brands
	has_many :categories


	has_attached_file :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	validates :name, :detail, :general_code, :brand, :category, :bought_price, :sale_price, presence: true
	validates :bought_price, numericality: true
	validates :sale_price, numericality: true

	after_create :crear_subproducto

	def crear_subproducto
		subproducts.create("code" => general_code+"-0")
	end

	before_create do
		self.increase = 0
	end

	def correspondeAnombre(nombre)
    	parametros = nombre.split(' ')
    	parametros.each do |parametro|
      	if self.name.downcase.include?(parametro.downcase)
	        return true
    	  end
    	end
    	false
  	end

end
