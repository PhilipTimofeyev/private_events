class CreateEventAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendings do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
