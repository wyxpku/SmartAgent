json.array!(@actuators) do |actuator|
  json.extract! actuator, :id, :name, :capbility
  json.url actuator_url(actuator, format: :json)
end
