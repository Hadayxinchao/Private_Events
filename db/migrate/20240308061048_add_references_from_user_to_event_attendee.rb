class AddReferencesFromUserToEventAttendee < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_attendees, :user, foreign_key: true
  end
end
