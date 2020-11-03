class AddMeetupTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :meetup_time, :time, null: false
  end
end
