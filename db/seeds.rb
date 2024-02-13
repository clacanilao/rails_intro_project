# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'json'

Assignment.destroy_all
Launch.destroy_all
Rocket.destroy_all
Launchpad.destroy_all
Crew.destroy_all

url = 'https://api.spacexdata.com'

rockets = JSON.parse(Net::HTTP.get(URI("#{url}/v4/rockets")))
rockets.each do |c|
  rocket = Rocket.find_or_create_by(
    id:                c['id'],
    name:              c['name'],
    description:       c['description'],
    height:            c['height']['meters'],
    mass:              c['mass']['kg'],
    variant:           c['type'],
    image:             c['flickr_images'][0],
    costperlaunch:     c['cost_per_launch'],
    rateofsuccess:     c['success_rate_pct']
  )
end

launchpads = JSON.parse(Net::HTTP.get(URI("#{url}/v4/launchpads")))
launchpads.each do |c|
  launchpad = Launchpad.find_or_create_by(
    id:                c['id'],
    name:              c['name'],
    fullname:          c['full_name'],
    description:       c['details'],
    status:            c['status'],
    numoflaunches:     c['launch_attempts'],
    image:             c['images']['large'][0],
    latitude:          c['latitude'],
    longitude:         c['longitude']
  )
end

crews = JSON.parse(Net::HTTP.get(URI("#{url}/v4/crew")))
crews.each do |c|
  crew = Crew.find_or_create_by(
    id:           c['id'],
    name:         c['name'],
    image:        c['image'],
    status:       c['status'],
    wikilink:     c['wikipedia']
  )
end

launches = JSON.parse(Net::HTTP.get(URI("#{url}/v5/launches")))
launches.each do |c|
  launch = Launch.find_or_create_by(
    id:                 c['id'],
    date:               c['date_local'],
    rocket_id:          c['rocket'],
    launchpad_id:       c['launchpad'],
    success:            c['success'],
    name:               c['name'],
    image:              c['links']['patch']['large']
  )
end

assignments = launches
assignments.each do |c|
  if c['crew'].any?
    c['crew'].each do |l|
      assignment = Assignment.find_or_create_by(
        crew_id:      l['crew'],
        launch_id:    c['id'],
        role:         l['role']
      )
    end
  end
end


# launch_93 = Assignment.find_or_create_by(
#   crew_id:        "5ebf1a6e23a9a60006e03a7a",
#   launch_id:      "5eb87d46ffd86e000604b388",
#   role:           "Joint Commander"
# )


