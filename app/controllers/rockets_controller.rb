class RocketsController < ApplicationController
  def index
    @rockets = Rocket.all.page(params[:page]).per(9)
  end

  def show
    @rocket = Rocket.find(params[:id])
    @launchpads = Launchpad.joins(launches: :rocket)
                 .where("rockets.id = ?", params[:id])
                 .select("DISTINCT launchpads.id, launchpads.name")
    @launches = Launch.where(rocket_id: params[:id]).select("launches.id, launches.name")
  end
end
