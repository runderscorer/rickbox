class RentFilm

  def self.call(user_id, film_id)
    rental = Rental.new(user_id: user_id, film_id: film_id)
    if rental.save
      Film.find(film_id).update_attribute('available', false)
      rental
    end
  end

end