require 'dashing'

configure do
  set :auth_token, ENV['YOUR_AUTH_TOKEN']
  set :port, ENV['OPENSHIFT_RUBY_PORT'] if ENV['OPENSHIFT_RUBY_PORT']
  set :bind, ENV['OPENSHIFT_RUBY_IP'] if ENV['OPENSHIFT_RUBY_IP']
  defalt_station_list = [ 268, 257, 2010 ]
  set :nearby_stations, defalt_station_list
  set :nearby_stations, ENV['CITIBIKE_NEARBY_STATIONS'].split(',').map{|id| id.to_i} if ENV['CITIBIKE_NEARBY_STATIONS']
  set :default_dashboard, 'citibike'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

before '/citibike' do
  #this request is slow, it would be nice if the remote server could filter on station_id
  all_stations = Citibikenyc.stations.results
  @stations = all_stations.select{|station| settings.nearby_stations.include?(station.id) }
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
