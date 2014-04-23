class TechnicalService < ActiveRecord::Base
	attr_accessible :product_code, :client, :status, :detail, :product_name, :problems, :repairs

	validates :detail, presence: {:message => "Es un campo obligatorio"}
	validates :detail, length: {minimum: 10, maximum: 100, :message => "El detalle debe tener minimo 10 y maximo 100 caracteres"}

	validates :problems, presence: {:message => "Es un campo obligatorio"}
	validates :problems, length: {minimum: 10, maximum: 100, :message => "Debe tener minimo 10 y maximo 100 caracteres"}

	validates :repairs, presence: {:message => "Es un campo obligatorio"}
	validates :repairs, length: {minimum: 10, maximum: 100, :message => "Debe tener minimo 10 y maximo 100 caracteres"}

	validates :product_name, presence: {:message => "Es un campo obligatorio"}
	validates :product_name, length: {minimum: 4, maximum: 20, :message => "El nombre del producto debe tener minimo 4 y maximo 20 caracteres"}

	validates :client, presence: {:message => "Es un campo obligatorio"}
	validates :client, length: {minimum: 3, maximum: 30, :message => "El cliente debe tener minimo 3 y maximo 30 caracteres"}

	validates :product_code, presence: {:message => "Es un campo obligatorio"}
	validates :product_code, length: {minimum: 5, maximum: 20, :message => "El Detalle debe tener minimo 5 y maximo 20 caracteres"}
end
