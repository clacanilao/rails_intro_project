class RocketsController < ApplicationController
  def index
    @rockets = Rocket.all
  end

  def show
    @rocket = Rocket.find(params[:id])
  end
end
