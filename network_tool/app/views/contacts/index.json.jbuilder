json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :user_id, :email, :information
  json.url contact_url(contact, format: :json)
end
