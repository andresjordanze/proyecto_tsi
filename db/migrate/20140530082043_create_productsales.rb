class CreateProductsales < ActiveRecord::Migration
  def change
    create_table :productsales do |t|
 	  t.string :name
 	  t.string :code
 	  t.integer :price
 	  t.integer :sale_id
 	  t.integer :subproduct_id
      t.timestamps
    end
  end
end
