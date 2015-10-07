class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to films_path, notice: 'Signed in!'
    else
      flash.now[:error] = 'Incorrect email or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Signed out.'
    redirect_to root_path
  end

end