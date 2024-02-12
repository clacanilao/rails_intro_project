class RocketsController < ApplicationController
  def index
    @rockets = Rocket.all
  end

  def show
    @rocket = Rocket.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @rockets = Movie.where("title LIKE ?", wildcard_search)
  end
end
