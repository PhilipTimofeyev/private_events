class AddEventTimeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :event_time, :datetime
  end
end
