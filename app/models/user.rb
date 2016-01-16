class User < ActiveRecord::Base
  has_many :appointments
  has_many :comments

  #uncomment this after deployent or localhost installation and after the first user has been signed up!
  validates :name, :expiration_date, :personal_number, :phone_number, :email, :password, :password_confirmation, :address, :user_role, presence: true

  #Search action for users in users page
  def self.search(query)
     where("name || registration_date || expiration_date || personal_number || phone_number || email || address || user_role  || id like ?", "%#{query}%")
   end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
