require "spec_helper"

describe Event do
  context "scopes" do
    describe ".upcoming" do
      let!(:historic_events) { create_list(:event, 2, time: 1.week.ago) }
      let!(:upcoming_events) { create_list(:event, 2, time: 1.week.from_now) }

      it { expect(Event.upcoming).to match_array upcoming_events }
    end

    describe ".historic" do
      let!(:historic_events) { create_list(:event, 2, time: 1.week.ago) }
      let!(:upcoming_events) { create_list(:event, 2, time: 1.week.from_now) }

      it { expect(Event.historic).to match_array historic_events }
    end
  end

  describe ".import_meetup_events" do
    let(:status) { :past_present_future }

    before { Meetup.stub("#{status}_events") { [meetup] } }

    context "ruby meetup" do
      let(:meetup) { ruby_meetup }

      it "creates an event with the correct details" do
        expect { Event.import_meetup_events(status) }.to change(Event, :count).by(1)

        event = Event.last
        expect(event.name).to           eq meetup["name"]
        expect(event.description).to    eq meetup["description"]
        expect(event.event_url).to      eq meetup["event_url"]
        expect(event.time).to           eq Time.at(meetup["time"].to_i/1000)
        expect(event.venue_name).to     eq meetup["venue"]["name"]
        expect(event.venue_address).to  eq meetup["venue"]["address_1"]
        expect(event.venue_lat).to      eq meetup["venue"]["lat"]
        expect(event.venue_lon).to      eq meetup["venue"]["lon"]
        expect(event.meetup_id).to      eq meetup["venue"]["id"]
      end
    end

    context "other meetups (not hosted)" do
      let(:meetup) { other_meetup }

      it "doesn't create an event" do
        expect { Event.import_meetup_events(status) }.to_not change(Event, :count).by(1)
      end
    end
  end
end
