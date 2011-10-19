class TravelTime
  include DataMapper::Resource
  validates_presence_of :previous_id, :next_id, :line_id, :duration
  property :id, Serial
  property :previous_id, Integer
  property :next_id, Integer
  property :line_id, Integer
  property :duration, Integer
end

class Stop
  include DataMapper::Resource
  attr_accessor :time_to_next_station
  validates_presence_of :name
  property :id, Serial
  property :name, String
end

class LinesStop
  include DataMapper::Resource
  validates_presence_of :line_id, :stop_id
  property :line_id, Integer, key: true
  property :stop_id, Integer
end

class User
  include DataMapper::Resource
  validates_presence_of :role_id, :name, :email, :password_hash, :settings
  property :id, Serial
  property :role_id, Integer
  property :name, String
  property :email, String
  property :password_hash, String
  property :settings, String
end

class Provider
  include DataMapper::Resource
  validates_presence_of :name
  property :id, Serial
  property :name, String
end

class LkLine
  include DataMapper::Resource
  validates_presence_of :vehicle_type_id, :name, :provider_id
  property :id, Serial
  property :vehicle_type_id, Integer
  property :name, String
  property :foreground_color, String
  property :background_color, String
  property :provider_id, Integer
end

class Role
  include DataMapper::Resource
  validates_presence_of :name
  property :id, Serial
  property :name, String
end

class VehicleType
  include DataMapper::Resource
  validates_presence_of :name
  property :id, Serial
  property :name, String
end

class Position
  include DataMapper::Resource
  validates_presence_of :line_id, :stop_id, :position
  property :id, Serial
  property :line_id, Integer
  property :stop_id, Integer
  property :position, Integer
end