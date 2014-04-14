class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :cantidad
      t.references :product
      t.references :order

      t.timestamps
    end
    add_index :incomes, :product_id
    add_index :incomes, :order_id
  end
end
