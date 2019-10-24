class Review < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	validates_presence_of :title,:rating,:restaurant_id,:user_id
	validates_numericality_of :restaurant_id,:user_id, greater_than: 0
	validates_numericality_of :rating,within: 1..5
	validates_length_of :body, minimum: 10, allow_blank: true
end
