require 'dashing'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'
  set :nearby_stations, ENV['CITIBIKE_NEARBY_STATIONS'].split(',').map{|id| id.to_i}
  set :default_dashboard, 'citibike'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

before '/citibike' do
  all_stations = Citibikenyc.stations.results
  @stations = all_stations.select{|station| settings.nearby_stations.include?(station.id) }
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application