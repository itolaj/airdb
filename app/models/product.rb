class Product < ActiveRecord::Base

  #dragonfly gem for the images(in our case we called them assets)
  dragonfly_accessor :asset
  #Validation for the empty fields
  validates :product_name, :description, :product_model, :serial_number, :price, :stock, :asset, presence: true

   #Search action for products in products page
  def self.search(query)
     where("product_name || description || product_model || serial_number || price || stock || id like  ?", "%#{query}%")
   end
end
