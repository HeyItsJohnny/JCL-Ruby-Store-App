json.array!(@carts) do |cart|
  json.extract! cart, :id
  json.url widget_url(cart, format: :json)
end
