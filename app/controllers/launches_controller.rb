class LaunchesController < ApplicationController
  def index
    @launches = Launch.all
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
