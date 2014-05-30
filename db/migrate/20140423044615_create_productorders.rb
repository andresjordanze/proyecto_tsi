class CreateProductorders < ActiveRecord::Migration
  def change
    create_table :productorders do |t|
      t.string :code
      t.string :name
      t.integer :productname_id
      t.text :description
      t.integer :quantity
      t.boolean :ingresado
      t.integer :price
      t.integer :total_price
      t.references :order, index: true
      t.timestamps
    end
  end
end