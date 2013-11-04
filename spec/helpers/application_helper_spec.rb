require "spec_helper"

describe ApplicationHelper do
  describe "#format_when" do

    context "when from and to are on the same date" do
      let(:from) { DateTime.new(2013, 12, 01, 19, 0) }
      let(:to)   { DateTime.new(2013, 12, 01, 21, 0) }

      it "returns a formatted string" do
        duration = helper.format_when(from, to)
        expect(duration).to eq "Dec 1, 2013 - 7:00pm to 9:00pm"
      end
    end

    context "when from and to are on different dates" do
      let(:from) { DateTime.new(2013, 12, 01,  9, 0) }
      let(:to)   { DateTime.new(2013, 12, 02, 17, 0) }

      it "returns a formatted string" do
        duration = helper.format_when(from, to)
        expect(duration).to eq "Dec 1, 9:00am to Dec 2, 5:00pm"
      end
    end
  end
end
