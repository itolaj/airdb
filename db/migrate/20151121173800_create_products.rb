class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_model
      t.string :serial_number
      t.integer :price
      t.integer :stock
      t.string :image

      t.timestamps null: false
    end
  end
end
