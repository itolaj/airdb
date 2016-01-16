class Airdb < ActiveRecord::Base

  #Search action for products in home page,in our case its airdb
  def self.search(query)
     where("product_name || description || product_model || serial_number || price || stock || id like ?", "%#{query}%")
   end

end
