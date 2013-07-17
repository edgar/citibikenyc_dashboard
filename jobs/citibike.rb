require 'citibikenyc'

SCHEDULER.every '60s' do
  Citibikenyc.stations_status.results.each do |station|
    if settings.nearby_stations.include?(station[:id])
      send_event(
        "station_#{station[:id]}",
        {
          value: station[:availableBikes],
          moreinfo: "# of docks available: #{station[:availableDocks]}"
        }
      )
    end
  end
end