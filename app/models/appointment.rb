class Appointment < ActiveRecord::Base

 belongs_to :user
 has_many :comments

 #validation of empty fields
 validates :customer_name, :technician_name, :phone_number, :appointment_type, :address, :product_model, :appointment_date, presence: true

 #Search action for appointments in appointments page
 def self.search(query)
    where("customer_name || technician_name || appointment_type || phone_number || product_model || appointment_date || status || appointment_note || id like ?", "%#{query}%")
  end

end
