class FilmsController < ApplicationController
  
  def index
    @films = Film.all
  end

  def sort_column
    if params[:ascending] == 'false'
      @films = Film.all.sort_by {|film| film.send(params[:column]).to_s}.reverse
    else
      @films = Film.all.sort_by {|film| film.send(params[:column]).to_s}
    end
        
    respond_to do |format|
      format.js
    end
  end

  def update
    Film.find(params[:film_id]).update_attribute('available', params[:available])
    redirect_to films_path
  end

end