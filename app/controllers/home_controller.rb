class HomeController < ApplicationController
  def index
    @launchpadimg = Launchpad.select(:image).first&.image
    @rocketimg = Rocket.select(:image).last&.image
  end
end
