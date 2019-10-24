class Cuisine < ActiveRecord::Base
	belongs_to :restaurant
	has_many :restaurant_cuisines
	has_many :restaurants,through: :restaurant_cuisines
	validates_presence_of :name
end
