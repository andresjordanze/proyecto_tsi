class CreateProductorders < ActiveRecord::Migration
  def change
    create_table :productorders do |t|
      t.string :name

      t.timestamps
    end
  end
end
