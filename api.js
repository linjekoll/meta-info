// Data format for provider API

// GET /:api_key/providers/:provider_id/journeys/:journey_id

// Valid events: "did_leave_station", "update", "alert"  
vehicle = {
  // What kind of event is this?_
  event: "event",
  // Unique id for the vehicle. Derived straight from the provider, not persisted in the database.
  // Database id
  origin_station: 8998235,
  // Database id
  destination_station: 898345,
  // Database id for the current station
  station_id: 123123,
  // The arrival time at the destination. A Unix time stamp.
  arrival_time: 1235,
  // If the event is an alert event, this message contains information about the alert
  alert_message: "oops!",
  // Database id
  line_id: 2342
}