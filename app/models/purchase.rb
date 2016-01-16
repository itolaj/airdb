class Purchase < ActiveRecord::Base

  #Validation for empty fields
  validates :customer_name, :product_name, :product_model, :price, :purchase_date, :maintnance_date, presence: true

  #Search action for pruchases in purchases page
  def self.search(query)
     where("customer_name || product_name || product_model || price || purchase_date || maintnance_date || id like ?", "%#{query}%")
   end

end
