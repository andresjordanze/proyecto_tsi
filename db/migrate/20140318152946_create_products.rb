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
      t.integer :sale_price     
      t.integer :quantity
      t.integer :modify_quantity
      t.boolean :home
      t.timestamps
    end
  end
end
