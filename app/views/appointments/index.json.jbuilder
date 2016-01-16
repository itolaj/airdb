json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :customer_name, :phone_number, :appointment_type, :address, :product_model, :appointment_note, :status, :appointment_date
  json.url appointment_url(appointment, format: :json)
end
