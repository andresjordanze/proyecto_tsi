class CreateProductorders < ActiveRecord::Migration
  def change
    create_table :productorders do |t|
      t.string :name
      t.integer :quantity
      t.string :code
      t.boolean :state
      t.references :order, index: true
      t.timestamps
    end
  end
end
