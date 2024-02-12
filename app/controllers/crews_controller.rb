class CrewsController < ApplicationController
  def index
    @crews = Crew.all
  end

  def show
    @crew = Crew.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @crews = Movie.where("title LIKE ?", wildcard_search)
  end
end
