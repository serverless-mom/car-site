json.array!(@households) do |household|
  json.extract! household, :id, :address, :city, :state, :number_of_bedrooms, :zip
  json.url household_url(household, format: :json)
end
