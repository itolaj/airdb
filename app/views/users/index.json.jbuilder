json.array!(@users) do |user|
  json.extract! user, :id, :name, :registration_date, :expiration_date, :personal_number, :phone_number, :email, :address, :user_role
  json.url user_url(user, format: :json)
end
