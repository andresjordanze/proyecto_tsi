class Provider < ActiveRecord::Base
	attr_accessible :name
	validates :name, presence: {:message => "Usted debe ingresar el nombre de proveedor"}	
	validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo Letras Permitidas" }
end
