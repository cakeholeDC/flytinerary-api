class TravelerTrip < ApplicationRecord
  belongs_to :traveler
  belongs_to :trip
end
