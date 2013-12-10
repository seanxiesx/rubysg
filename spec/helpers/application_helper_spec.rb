require "spec_helper"

describe ApplicationHelper do
  describe "#event_link_name" do
    context "when event happened in the past" do
      let(:event) { build(:event, time: 1.week.ago) }

      it { expect(event_link_name(event)).to eq "Details & Slides" }
    end

    context "when event happens in the future" do
      let(:event) { build(:event, time: 1.week.from_now) }

      it { expect(event_link_name(event)).to eq "RSVP" }
    end
  end
end
