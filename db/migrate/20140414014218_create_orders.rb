class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :numero_pedido
    	t.string :estado
    	t.string :provider
    	t.boolean :ingresado

      t.timestamps
    end
  end
end
