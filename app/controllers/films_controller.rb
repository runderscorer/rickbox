class FilmsController < ApplicationController
  
  def index
    @films = Film.all
  end

  def sort_column
    if params[:ascending] == 'false'
      @films = Film.all.sort_by {|film| film.send(params[:column])}.reverse
    else
      @films = Film.all.sort_by {|film| film.send(params[:column])}
    end
        
    respond_to do |format|
      format.js
    end
  end
end