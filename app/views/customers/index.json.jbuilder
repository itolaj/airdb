json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_name, :username, :password, :registration_date, :email, :phone_number, :address, :gender
  json.url customer_url(customer, format: :json)
end
