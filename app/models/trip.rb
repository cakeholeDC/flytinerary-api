class Trip < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips
  # belongs_to :traveler
  belongs_to :organizer, class_name: "Traveler", foreign_key: "traveler_id"

  def self.parseDateString(string)
		#input format is yyyy-mm-dd
		arr = string.split('-')

		arr.map do |index|
			index.to_i
		end
	end

	def attendees
		self.travelers.uniq
	end

	def event_timeline
		self.events.sort_by do |event|
			event.start_datetime
		end
	end
end
