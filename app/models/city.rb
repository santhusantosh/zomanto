class City < ActiveRecord::Base

has_many :locations
has_many :restaurants

	validates_presence_of :name
end
