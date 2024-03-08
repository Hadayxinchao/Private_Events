class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees, source: :attendee
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :upcoming_events, -> { where("date > ?",Time.now) }
  scope :past_events, -> { where("date < ?", Time.now) }
end
