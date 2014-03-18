class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :price
      t.string :detail
      t.integer :check_number
      t.string :client_name
      t.timestamps
    end
  end
end
