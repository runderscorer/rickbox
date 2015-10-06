class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      redirect_to films_path
    else
      render 'new'
    end
  end

end