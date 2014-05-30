class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :estado
    	t.integer :provider_id
    	t.boolean :ingresado

      t.timestamps
    end
  end
end
