class CreateProductnames < ActiveRecord::Migration
  def change
    create_table :productnames do |t|
    	t.string :name
    	t.string :code
    	t.string :description
    	t.string :serial
    	t.string :brand

      t.timestamps
    end
  end
end
