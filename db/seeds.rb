# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	gerente = User.new
	gerente.username = 'gerente'
	gerente.name = 'gerente gerente'
	gerente.password = 'gerente123'
	gerente.rol = 'gerente'
	gerente.save!

	admin = User.new
	admin.username = 'admin'
	admin.name = 'Administrador Admin'
	admin.password = 'admin123'
	admin.rol = 'admin'
	admin.save!

	secretaria = User.new
	secretaria.username = 'secre'
	secretaria.name = 'Secretaria Secre'
	secretaria.password = 'secre123'
	secretaria.rol = 'secre'
	secretaria.save!

	almacenero = User.new
	almacenero.username = 'almacenero'
	almacenero.name = 'Almacen Alma'
	almacenero.password = 'almacen123'
	almacenero.rol = 'enc_almacen'
	almacenero.save!		

	brands = Brand.create([{name: "Toshiba"}, {name: "Dell"}, {name: "Sony"}, {name: "3M"}, {name: "ASUS"}, {name: "Samsung"}, {name: "ViewSonic"}, {name: "Amazon"}, {name: "Apple"}, {name: "eBeam"}, {name: "Epson"}, {name: "BenQ"}, {name: "NEC"}, {name: "HP"}])
	categories = Category.create([{name: "Laptops"}, {name: "Maletines"}, {name: "Mochilas"}, {name: "Accesorios"}, {name: "Impresoras"}, {name: "Proyectores"}, {name: "Tablets"}, {name: "Mobiliarios"}])
	providers = Provider.create([{name: "Toshiba"}, {name: "Dell"}, {name: "Sony"}, {name: "3M"}, {name: "ASUS"}, {name: "Samsung"}, {name: "ViewSonic"}, {name: "Amazon"}, {name: "Apple"}, {name: "eBeam"}, {name: "Epson"}, {name: "BenQ"}, {name: "NEC"}, {name: "HP"}])
