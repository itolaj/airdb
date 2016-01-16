class Comment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :user
end
