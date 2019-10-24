class Location < ActiveRecord::Base

	belongs_to :city
	has_many :restaurants

	validates_presence_of :name,:city_id
end
