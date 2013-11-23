class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :name
      t.text      :description
      t.text      :event_url
      t.datetime  :time
      t.string    :venue_name
      t.string    :venue_address
      t.float     :venue_lat
      t.float     :venue_lon
      t.integer   :meetup_id

      t.timestamps
    end

    add_index :events, :meetup_id
  end
end
