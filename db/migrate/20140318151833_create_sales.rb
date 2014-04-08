class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :price
      t.integer :check_number
      t.string :client_name
      t.integer :nit
      t.timestamps
    end
  end
end
