class ApplicationController < ActionController::Base
  def search
    wildcard_search = "%#{params[:keywords]}%"
    category = params[:category]
    case category
      when 'launches'
        @url =  search_launches_path
        @results = Launch.where("name LIKE ?", wildcard_search)
      when 'rockets'
        @url = search_rockets_path
        @results = Rocket.where("name LIKE ?", wildcard_search)
      when 'launchpads'
        @url = search_launchpads_path
        @results = Launchpad.where("name LIKE ?", wildcard_search)
      when 'crews'
        @url = search_crews_path
        @results = Crew.where("name LIKE ?", wildcard_search)
    end
  end
end