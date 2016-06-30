json.array!(@controllers) do |controller|
  json.extract! controller, :id, :Reminder
  json.url controller_url(controller, format: :json)
end
