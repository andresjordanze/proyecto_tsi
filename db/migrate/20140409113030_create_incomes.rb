class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :fecha
      t.references :product

      t.timestamps
    end
    add_index :incomes, :product_id
  end
end
