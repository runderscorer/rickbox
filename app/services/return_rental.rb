class ReturnRental

  def self.call(rental_id, film_id)
    rental = Rental.find(rental_id)
    rental.returned_at = Date.today

    film = Film.find(film_id)
    film.available = true    
    
    if rental.save && film.save
      rental
    end
  end

end