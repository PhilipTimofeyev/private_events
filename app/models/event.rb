class Event < ApplicationRecord
	has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
	has_many :attendees, through: :event_attendings, source: :attendee
	belongs_to :creator, class_name: "User"

	scope :past, -> { where(date: ..Date.current) }
	scope :future, -> { where(date: Date.current..) }

	validates :date, presence: true
	validates :location, presence: true

end