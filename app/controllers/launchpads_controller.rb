class LaunchpadsController < ApplicationController
  def index
    @launchpads = Launchpad.all
  end

  def show
    @launchpad = Launchpad.find(params[:id])
  end
end
