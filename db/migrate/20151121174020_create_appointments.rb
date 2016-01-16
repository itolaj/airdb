class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :customer_name
      t.string :phone_number
      t.string :appointment_type
      t.string :address
      t.string :product_model
      t.date :appointment_date

      t.timestamps null: false
    end
  end
end
