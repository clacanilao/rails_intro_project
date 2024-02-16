class LaunchesController < ApplicationController
  def index
    @launches = Launch.all.page(params[:page]).per(9)
  end

  def show
    @launch = Launch.find(params[:id])
    @rocketname = Rocket.where(id: @launch.rocket_id)
                        .select("name")
    @launchpadname = Launchpad.where(id: @launch.launchpad_id)
                        .select("name")
    @crews = Crew.joins(assignments: :launch)
                 .where("launches.id = ?", params[:id])
                 .select("crews.id, crews.name, assignments.role")
  end
end
