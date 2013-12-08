class Event < ActiveRecord::Base

  def latlon
      [self.venue_lat, self.venue_lon].join(' ')
  end

  class << self
    def import_meetup_events(type)
      meetups = Meetup.send("#{type}_events")
      meetups.each do |meetup|
        # Events that are suggested (i.e. Hackathons) do not have a events_host field
        next unless meetup["event_hosts"]

        Event.where(meetup_id: meetup["id"]).first_or_create!(attrs_from_meetup(meetup))
      end
    end

    private

    def attrs_from_meetup(meetup)
      {
        :name           => meetup["name"],
        :description    => meetup["description"],
        :event_url      => meetup["event_url"],
        :time           => Time.at(meetup["time"].to_i/1000),
        :venue_name     => meetup["venue"]["name"],
        :venue_address  => meetup["venue"]["address_1"],
        :venue_lat      => meetup["venue"]["lat"],
        :venue_lon      => meetup["venue"]["lon"],
        :meetup_id      => meetup["venue"]["id"]
      }
    end
  end
end
