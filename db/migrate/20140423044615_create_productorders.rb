class CreateProductorders < ActiveRecord::Migration
  def change
    create_table :productorders do |t|
      t.string :code
      t.string :nombre_producto
      t.text :description
      t.integer :quantity
      t.boolean :ingresado
      t.references :order, index: true
      t.timestamps
    end
  end
end
