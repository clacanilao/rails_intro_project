class LaunchesController < ApplicationController
  def index
    @launches = Launch.all
  end

  def show
    @launch = Launch.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @launches = Movie.where("title LIKE ?", wildcard_search)
  end
end
