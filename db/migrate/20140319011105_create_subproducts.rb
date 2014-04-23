class CreateSubproducts < ActiveRecord::Migration
  def change
    create_table :subproducts do |t|
      t.string :code
      t.boolean :available
      t.references :product, index: true
      t.references :sale, index: true
      t.timestamps
    end
  end
end
