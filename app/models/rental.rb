class Rental < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

  def self.current
    where(returned_at: nil)
  end

  def self.returned
    where.not(returned_at: nil)
  end
end
