class RentalsController < ApplicationController
  before_action :current_user, only: :new
  helper_method :current_rentals
  helper_method :returned_rentals

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end
  
  def new
    if current_user
      create params[:film_id]
    else
      redirect_to sign_in_path
    end
  end

  def create(film_id)
    rental = RentFilm.call(current_user.id, film_id)
    if rental.present?
      flash[:notice] = 'Rented!'
    else
      flash[:error] = 'Woops! There was a problem with your rental.'
    end
    redirect_to films_path
  end

  def update
    rental = ReturnRental.call(params[:rental_id], params[:film_id])
    if rental.present?
      flash[:notice] = 'Returned!'
    else
      flash[:error] = 'Woops! There was a problem with your return.'
    end
    redirect_to rentals_path
  end
  
  def current_rentals
    @current_rentals = current_user.rentals.current
  end

  def returned_rentals
    @returned_rentals = current_user.rentals.returned
  end
end