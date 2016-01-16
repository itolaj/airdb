class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :username
      t.string :password
      t.date :registration_date
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :gender

      t.timestamps null: false
    end
  end
end
