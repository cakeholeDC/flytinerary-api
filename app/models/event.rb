class Event < ApplicationRecord
  belongs_to :trip
  belongs_to :traveler
  belongs_to :traveler_name, class_name: 'Traveler', foreign_key: "traveler_id"

  	def self.parseDateTimeString(string)
		#input format is yyyy-mm-ddTHH:MM
		string.gsub!('T','-')
		string.gsub!(':','-')
		arr = string.split('-')

		arr.map do |index|
			index.to_i
		end
	end
end
