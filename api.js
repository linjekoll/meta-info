// Data format for provider API

vehicle = {
  // What kind of event is this?_
  event:
    [
      didLeaveStation,
      update,
      alert  
    ],
  // Unique id for the vehicle. Derived straight from the provider, not persisted in the database.
  id: "89824",
  // Database id
  origin_station: 8998235,
  // Database id
  destination_station: 898345,
  // The arrival time at the destination. A Unix time stamp.
  time_to_arrival: 1235,
  // If the event is an alert event, this message contains information about the alert
  alert_message: "oops!",
  // Database id
  line_id: 2342,
  // Database id
  provider_id: 23,
}