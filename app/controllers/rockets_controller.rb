class RocketsController < ApplicationController
  def index
    @rockets = Rocket.all.page(params[:page]).per(9)
  end

  def show
    @rocket = Rocket.find(params[:id])
    @launchpads = Launchpad.joins(launches: :rocket)
                 .where("rockets.id = ?", params[:id])
                 .pluck("launchpads.id", "launchpads.name", "launches.id", "launches.name")
  end
end
