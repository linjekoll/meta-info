# -*- encoding : utf-8 -*-
require "jsonify"
require "dm-core"  
require "dm-validations"
require "dm-timestamps"
require "dm-mysql-adapter"
require "yaml"
require "./helpers"
require "./models"

database = YAML.load_file("config.yaml")
DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "#{database["adapter"]}://#{database["username"]}:#{database["password"]}@#{database["host"]}:#{database["port"]}/#{database["database"]}")

DataMapper.finalize

# Delete everything
[
  VehicleType, 
  Role, 
  LkLine, 
  Provider, 
  User, 
  Stop, 
  TravelTime, 
  LinesStop,
  Position
].each(&:destroy)

provider = Provider.create!({
  name: "Västtrafik"
})

vehicle = VehicleType.create!({
  name: "Spårvagn"
})

line = LkLine.create!({
  vehicle_type_id: vehicle.id,
  name: "4",
  provider_id: provider.id,
  foreground_color: "#00ff00",
  background_color: "#ffffff"
})

role = Role.create!({
  name: "Admin"
})

user = User.create!({
  name: "Jesper",
  email: "jesper.josefsson@gmail.com",
  password_hash: "M2qEG52qU7YLXbsiU4dCNFn8AVnEmyAd1O1VAbZFWwE7/dhCsWQ1qNSj+EK/I5+D",
  role_id: role.id,
  settings: "#{line.id}"
})

position = 1
stops = File.read("stops.js").from_json.map do |stop|
  item = Stop.create!({
    name: stop["name"],
  })
  
  LinesStop.create!({
    line_id: line.id,
    stop_id: item.id
  })
  
  Position.create!({
    line_id: line.id,
    stop_id: item.id,
    position: position
  })
  
  position = position + 1
  item.time_to_next_station = stop["time_to_next_station"]
  item
end

stops.each_with_index do |stop, index|
  TravelTime.create!({
    line_id: line.id,
    duration: stop.time_to_next_station,
    next_id: stops[index + 1].try(:id),
    previous_id: stop.id
  })
end