class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.text :description
      t.string :general_code
      t.string :brand
      t.string :category
      t.integer :bought_price
<<<<<<< HEAD
      t.integer :sale_price           
=======
      t.integer :sale_price     
      t.integer :quantity
>>>>>>> b09bcd00b365915f6f912066c0f949a405c1cb18
      t.timestamps
    end
  end
end
