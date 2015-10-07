class RentalsController < ApplicationController
  before_action :current_user, only: :new
  helper_method :current_rentals
  helper_method :returned_rentals

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end
  
  def new
    if current_user
      create film_id: params[:film_id]
    else
      redirect_to sign_in_path
    end
  end

  def create(film_id)
    rental = Rental.new(user_id: current_user.id, film_id: params[:film_id])

    if rental.save
      Film.find(params[:film_id]).update_attribute('available', false)
      redirect_to films_path
    end
  end

  def update
    Rental.find(params[:rental_id]).update_attribute('returned_at', Date.today)

    Film.find(params[:film_id]).update_attribute('available', true)
    redirect_to films_path
  end
  
  def current_rentals
    @current_rentals = current_user.rentals.current
  end

  def returned_rentals
    @returned_rentals = current_user.rentals.returned
  end
end