class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :title
      t.text      :description
      t.datetime  :from
      t.datetime  :to
      t.string    :venue
      t.string    :rsvp_link

      t.timestamps
    end
  end
end
