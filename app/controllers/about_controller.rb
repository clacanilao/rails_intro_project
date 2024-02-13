class AboutController < ApplicationController
  def index
    @current_url = request.url
  end
end
