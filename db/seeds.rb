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
# Lista de Clientes

	client1 = Client.new
	client1.name = 'Andres Jordan'
	client1.nit = 1234567
	client1.phone = 4489290
	client1.save!

	client2 = Client.new
	client2.name = 'Oscar Gonzalez'
	client2.nit = 2234567
	client2.phone = 3489101
	client2.save!

#Lista de proveedores

	prov1 = Provider.new
	prov1.name = 'Toshiba'
	prov1.phone = 1234567
	prov1.mail = 'toshiba@hotmail.com'
	prov1.address = 'Miami'
	prov1.save!

	prov2 = Provider.new
	prov2.name = 'Dell'
	prov2.phone = 7654321
	prov2.mail = 'dell@yahoo.com'
	prov2.address = 'Washigton'
	prov2.save!

	prov3 = Provider.new
	prov3.name = 'Apple'
	prov3.phone = 7890123
	prov3.mail = 'apple@yahoo.com'
	prov3.address = 'California'
	prov3.save!
	

	prodnames1 = Productname.new
	prodnames1.name = 'toshiba-x10'
	prodnames1.code = 'tosh-x10'
	prodnames1.description = 'pantalla 17 pulgadas, teclado ingles, core i7 tercera generacion'
	prodnames1.brand_id = 1
	prodnames1.save!
	

	prodnames2 = Productname.new
	prodnames2.name = 'dell-inp'
	prodnames2.code = 'dellinp'
	prodnames2.description = 'pantalla 17 pulgadas, teclado ingles, core i7 tercera generacion'
	prodnames2.brand_id = 2
	prodnames2.save!


	prodnames3 = Productname.new
	prodnames3.name = 'sony-vaio'
	prodnames3.code = 'sonyv'
	prodnames3.description = 'pantalla 17 pulgadas, teclado ingles, core i7 tercera generacion'
	prodnames3.brand_id = 3
	prodnames3.save!


	prodnames4 = Productname.new
	prodnames4.name = 'proyector 3m'
	prodnames4.code = 'proy3m-a'
	prodnames4.description = 'lampara de 5000 lumenes, 3 Kg de peso'
	prodnames4.brand_id = 4
	prodnames4.save!


	prodnames5 = Productname.new
	prodnames5.name = 'asus-p10'
	prodnames5.code = 'asus-10'
	prodnames5.description = 'pantalla 17 pulgadas, teclado ingles, core i7 tercera generacion'
	prodnames5.brand_id = 5
	prodnames5.save!


	prodnames6 = Productname.new
	prodnames6.name = 'Samsung Galaxy Core'
	prodnames6.code = 'Sgalaxi-core'
	prodnames6.description = 'pantalla 4 pulgadas, dual core tercera generacion. pantalla tactil'
	prodnames6.brand_id = 6
	prodnames6.save!

	prodnames7 = Productname.new
	prodnames7.name = 'View son'
	prodnames7.code = 'view-sond'
	prodnames7.description = 'pantalla 4 pulgadas, dual core tercera generacion. pantalla tactil'
	prodnames7.brand_id = 7
	prodnames7.save!

	prodnames8 = Productname.new
	prodnames8.name = 'kindle'
	prodnames8.code = 'kindel-asd'
	prodnames8.description = 'pantalla 4 pulgadas, dual core tercera generacion. pantalla tactil'
	prodnames8.brand_id = 8
	prodnames8.save!

	prodnames9 = Productname.new
	prodnames9.name = 'mac book'
	prodnames9.code = 'mac-64'
	prodnames9.description = 'pantalla 4 pulgadas, dual core tercera generacion. pantalla tactil'
	prodnames9.brand_id = 9
	prodnames9.save!

	prodnames10 = Productname.new
	prodnames10.name = 'eBeam 46ms '
	prodnames10.code = 'ebeam46s'
	prodnames10.description = 'lampara de 5000 lumenes, 3 Kg de peso'
	prodnames10.brand_id = 10
	prodnames10.save!

	prodnames11 = Productname.new
	prodnames11.name = 'Epson ls300-ii'
	prodnames11.code = 'epls300ii'
	prodnames11.description = 'chorro de tinta, 5 kg, 5 colores'
	prodnames11.brand_id = 11
	prodnames11.save!





