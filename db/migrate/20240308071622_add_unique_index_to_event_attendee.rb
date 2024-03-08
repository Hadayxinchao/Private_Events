class AddUniqueIndexToEventAttendee < ActiveRecord::Migration[7.1]
  def change
    add_index :event_attendees, [:event_id, :attendee_id], unique: true
  end
end
