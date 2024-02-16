class SearchController < ApplicationController
  def search
    wildcard_search = "%#{params[:keywords]}%"
    category = params[:category]
    case category
      when 'all'
        @results = all_models(wildcard_search)
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

  private

  def all_models(wildcard_search)
    results = []
    [Launch, Rocket, Launchpad, Crew].each do |w|
      results.concat(w.where("name LIKE ?", wildcard_search))
    end
    results
  end
end
