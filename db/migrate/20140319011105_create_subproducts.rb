class CreateSubproducts < ActiveRecord::Migration
  def change
    create_table :subproducts do |t|
      t.string :code
      t.references :product, index: true

      t.timestamps
    end
  end
end
