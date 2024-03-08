class AdjustForeignKeyOnEventAttendees < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :event_attendees, :events
    add_foreign_key :event_attendees, :events, on_delete: :cascade
  end
end
