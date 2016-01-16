json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :customer_name, :product_name, :product_model, :price, :purchase_date, :maintnance_date
  json.url purchase_url(purchase, format: :json)
end
