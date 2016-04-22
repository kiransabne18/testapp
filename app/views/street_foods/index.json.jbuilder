json.array!(@street_foods) do |street_food|
  json.extract! street_food, :id, :name, :address
  json.url street_food_url(street_food, format: :json)
end
