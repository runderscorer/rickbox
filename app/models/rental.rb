class Rental < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
end
