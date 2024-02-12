class LaunchpadsController < ApplicationController
  def index
    @launchpads = Launchpad.all
  end

  def show
    @launchpad = Launchpad.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @launchpads = Movie.where("title LIKE ?", wildcard_search)
  end
end
