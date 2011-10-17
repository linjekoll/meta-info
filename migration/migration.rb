# -*- encoding : utf-8 -*-
require "mysql2"
require "jsonify"
require "dm-core"  
require "dm-validations"
require "dm-timestamps"
require "dm-mysql-adapter"
require "dm-serializer/to_json"
require "yaml"
require "./helpers"
require "./models"

database = YAML.load_file("config.yaml")
DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "#{database["adapter"]}://#{database["username"]}:#{database["password"]}@#{database["host"]}:#{database["port"]}/#{database["database"]}")

# Delete everything
[
  VehicleType, 
  Role, 
  LkLine, 
  Provider, 
  User, 
  Stop, 
  TravelTime, 
  LinesStop
].each(&:destroy)

role = Role.create!({
  name: "Administrator"
})

user = User.create!({
  name: "Jesper",
  role_id: role.id
})

provider = Provider.create!({
  name: "Västtrafik"
})

vehicle = VehicleType.create!({
  name: "Spårvagn"
})

line = LkLine.create!({
  vehicle_type_id: vehicle.id,
  name: "4",
  provider_id: provider.id
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