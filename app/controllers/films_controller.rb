class FilmsController < ApplicationController
  
  def index
    @films = Film.all
  end

  def sort_column
    @films = Film.all.sort_by {|film| film.send(params[:column])}

    respond_to do |format|
      format.js
    end
  end
end