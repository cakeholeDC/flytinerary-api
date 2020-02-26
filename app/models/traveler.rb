class Traveler < ApplicationRecord
	has_many :traveler_events
	has_many :events, through: :traveler_events
	has_many :traveler_trips
	has_many :trips, through: :traveler_trips
	has_many :organized, class_name: "Trip", foreign_key: "traveler_id"
end
