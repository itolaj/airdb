class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :customer_name
      t.string :product_name
      t.string :product_model
      t.integer :price
      t.date :purchase_date
      t.date :maintnance_date

      t.timestamps null: false
    end
  end
end
