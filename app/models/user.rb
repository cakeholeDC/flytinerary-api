class User < ApplicationRecord
	has_many :user_trips
	has_many :trips, through: :user_trips
	has_many :events
	has_many :organized, class_name: "Trip", foreign_key: "user_id"

	has_secure_password
	# validates :username, uniqueness: {case_sensititive: false}
end
