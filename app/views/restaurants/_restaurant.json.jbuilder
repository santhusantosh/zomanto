json.extract! restaurant, :id, :name, :city_id, :location_id, :address, :cost_avg, :delivery_facility, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
