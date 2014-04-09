# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	user = User.new
	user.username = 'admin'
	user.email = 'Administrador'
	user.password = 'admin123'
	user.rol = 'admin'
	user.save!	

	brands = Brand.create([{name: "Toshiba"}, {name: "Dell"}, {name: "Sony"}, {name: "3M"}, {name: "ASUS"}, {name: "Samsung"}, {name: "ViewSonic"}, {name: "Amazon"}, {name: "Apple"}, {name: "eBeam"}, {name: "Epson"}, {name: "BenQ"}, {name: "NEC"}, {name: "HP"}])
	categories = Category.create([{name: "Laptops"}, {name: "Maletines"}, {name: "Mochilas"}, {name: "Accesorios"}, {name: "Impresoras"}, {name: "Proyectores"}, {name: "Tablets"}, {name: "Mobiliarios"}])
