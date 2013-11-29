require "feature_spec_helper"

feature "RubySG Home Page" do
  let!(:upcoming_events) { create_list(:event, 2, time: 2.weeks.from_now) }
  let!(:historic_events) { create_list(:event, 2, time: 2.weeks.ago) }

  scenario "user can see events" do
    visit root_path

    page.should have_selector("[data-test=upcoming-event]", count: 2)
    upcoming_events.each do |event|
      page.should have_selector("[data-test=upcoming-event-name]", text: event.name)
      page.should have_selector("[data-test=upcoming-event-rsvp-link][href='#{event.event_url}']", text: "RSVP")
    end

    page.should have_selector("[data-test=historic-event]", count: 2)
    historic_events.each do |event|
      page.should have_selector("[data-test=historic-event-name]", text: event.name)
      page.should have_selector("[data-test=historic-event-details-link][href='#{event.event_url}']", text: "Details & Slides")
    end
  end
end
