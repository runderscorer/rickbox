class RentalsController < ApplicationController
  before_action :current_user, only: :new

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

end