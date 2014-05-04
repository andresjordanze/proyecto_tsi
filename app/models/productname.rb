class Productname < ActiveRecord::Base
	attr_accessible :name
	validates :name, presence: {:message => "Usted debe ingresar el nombre del producto"}	
	validates :name, uniqueness: {case_sensitive: false, :message => "El nombre ya existe"}
	validates :name, format: { with: /\A[a-zA-Z\d\s]+\z/,
    message: "Solo Letras Permitidas" }
end
