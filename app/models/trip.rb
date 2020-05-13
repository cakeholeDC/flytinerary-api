class Trip < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_trips
  has_many :users, through: :user_trips
  belongs_to :organizer, class_name: "User", foreign_key: "user_id"

  def self.parseDateString(string)
		#input format is yyyy-mm-dd
		arr = string.split('-')

		arr.map do |index|
			index.to_i
		end
	end

	def attendees
		self.users.uniq
	end

	def event_timeline
		self.events.sort_by do |event|
			event.start
		end
	end
end
