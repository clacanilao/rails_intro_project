class LaunchesController < ApplicationController
  def index
    @launches = Launch.all
  end

  def show
    @launch = Launch.find(params[:id])
    @crews = Crew.joins(assignments: :launch)
                 .where("launches.id = ?", params[:id])
                 .pluck("crews.id", "crews.name", "assignments.role")
  end
end
