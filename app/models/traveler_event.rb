class TravelerEvent < ApplicationRecord
  belongs_to :traveler
  belongs_to :event
end
