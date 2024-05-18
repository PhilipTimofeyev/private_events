class Event < ApplicationRecord
	has_many :event_attendings, foreign_key: :attended_event_id
	has_many :attendees, through: :event_attendings, source: :attendee
	belongs_to :creator, class_name: "User"


	def self.past
		where(date: ..Date.current)
	end

	def self.future
		where(date: Date.current..)
	end
end
