class Restaurant < ActiveRecord::Base
	has_many :reviews
	has_many :phones
	belongs_to :city
	belongs_to :location
	has_many :restaurant_cuisines
	has_many :cuisines,through: :restaurant_cuisines
	validates_presence_of :name,:city_id,:location_id,:address,:cost_avg,:delivery_facility
	validates_numericality_of :cost_avg,greater_than: 1
	#validates_presence_of :cuisine

end
