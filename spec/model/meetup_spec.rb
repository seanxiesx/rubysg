require "spec_helper"

describe Meetup do
  describe ".upcoming_events", :vcr do
    it "returns upcoming events" do
      events = Meetup.upcoming_events

      expect(events).to have_at_least(1).item
      events.each do |event|
        expect(event["status"]).to eq "upcoming"
      end
    end
  end

  describe ".historic_events", :vcr do
    it "returns historic events" do
      events = Meetup.historic_events

      expect(events).to have_at_least(1).item
      events.each do |event|
        expect(event["status"]).to eq "past"
      end
    end
  end
end
