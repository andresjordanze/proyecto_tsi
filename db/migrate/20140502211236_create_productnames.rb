class CreateProductnames < ActiveRecord::Migration
  def change
    create_table :productnames do |t|
    	t.string :name

      t.timestamps
    end
  end
end
