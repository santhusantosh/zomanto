class RestaurantCuisine < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :cuisine
	#validates_presence_of :restaurant_id,:cuisine_id
end
