class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :registration_date
      t.date :expiration_date
      t.integer :personal_number
      t.integer :phone_number
      t.string :email
      t.string :address
      t.string :user_role

      t.timestamps null: false
    end
  end
end
