class LaunchpadsController < ApplicationController
  def index
    @launchpads = Launchpad.all.page(params[:page]).per(9)
  end

  def show
    @launchpad = Launchpad.find(params[:id])
    @rockets = Rocket.joins(launches: :launchpad)
                 .where("launchpads.id = ?", params[:id])
                 .select("DISTINCT rockets.id, rockets.name")
    @launches = Launch.where(launchpad_id: params[:id]).select("launches.id, launches.name")
  end
end
