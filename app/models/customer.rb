class Customer < ActiveRecord::Base

  
  validates :customer_name, :username, :email, :phone_number, :address, :gender, presence: true

  #Search action for customers in customers page
  def self.search(query)
     where("customer_name || username || registration_date || email || phone_number || address || gender || id like ?", "%#{query}%")
   end
end
