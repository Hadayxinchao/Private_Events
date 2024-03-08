class CreateEventAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendees do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :attendee_id 
      
      t.timestamps
    end
  end
end
