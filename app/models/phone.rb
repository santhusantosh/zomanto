class Phone < ActiveRecord::Base
	belongs_to :restaurant

	validates_presence_of :restaurant_id,:phone_number
	validates_length_of :phone_number, minimum: 10
end
