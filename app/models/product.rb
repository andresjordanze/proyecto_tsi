
class Product < ActiveRecord::Base
	has_many :subproducts, dependent: :destroy
	has_many :incomes
    #validates :title, presence: true,
                    #length: { minimum: 8 }
	attr_accessible :name, :detail, :description, :increase, :quantity, :general_code, :brand, :category, :bought_price, :sale_price, :created_at, :updated_at, :photo
	belongs_to :sale
	has_many :brands
	has_many :categories


	has_attached_file :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	validates :brand, :category, presence: true

#	validates :name, uniqueness: {case_sensitive: false}	

	validates :name, presence: {:message => "Usted debe ingresar un nombre"}
	validates :general_code, uniqueness: {case_sensitive: false}	
	validates :name, length: {minimum: 2, maximum: 20, :message => "El Nombre debe tener minimo 2 y maximo 20 caracteres"}

	validates :detail, presence: {:message => "Usted debe ingresar un Detalle de producto"}
	validates :detail, length: {minimum: 10, maximum: 100, :message => "El Detalle debe tener minimo 10 y maximo 30 caracteres"}

	validates :general_code, presence: {:message => "Usted debe ingresar el Codigo general"}
	validates :general_code, length: {minimum: 2, maximum: 15, :message => "El Codigo general debe tener minimo 2 y maximo 15 caracteres"}

	validates :bought_price, presence: {:message => "Usted debe ingresar el Precio de compra"}
	validates :bought_price, numericality: {:message => "El precio de compra debe ser numerico"}
	
	validates :sale_price, presence: {:message => "Usted debe ingresar el precio de venta"}	
	validates :sale_price, numericality: {:message => "El precio de venta debe ser numerico"}

	after_create :crear_subproducto

	def crear_subproducto
		subproducts.create("code" => general_code+"-0")
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

	before_create do
		self.increase = 0
	end
end
