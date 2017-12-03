json.array!(@users) do |widget|
  json.extract! user, :id, :name, :password
  json.url user_url(user, format: :json)
end
