class SearchController < ApplicationController
  def search
    wildcard_search = "%#{params[:keywords]}%"
    category = params[:category]
    case category
      when 'launches'
        @results = Launch.where("name LIKE ?", wildcard_search)
      when 'rockets'
        @results = Rocket.where("name LIKE ?", wildcard_search)
      when 'launchpads'
        @results = Launchpad.where("name LIKE ?", wildcard_search)
      when 'crews'
        @results = Crew.where("name LIKE ?", wildcard_search)
    end
  end
end
