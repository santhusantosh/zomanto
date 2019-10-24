class RestHighlight < ActiveRecord::Base

	validates_presence_of :restaurant_id,:highlight_id
end
