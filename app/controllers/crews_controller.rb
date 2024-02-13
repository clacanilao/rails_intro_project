class CrewsController < ApplicationController
  def index
    @crews = Crew.all
  end

  def show
    @crew = Crew.find(params[:id])
    @launches = Launch.joins(assignments: :crew)
                      .where("crews.id = ?", params[:id])
                      .pluck("launches.id", "launches.name", "assignments.role")
  end
end
