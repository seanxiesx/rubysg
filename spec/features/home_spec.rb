require "feature_spec_helper"

feature "RubySG Home Page" do
  let!(:upcoming_events) { create_list(:event, 2, time: 2.weeks.from_now) }
  let!(:historic_events) { create_list(:event, 2, time: 2.weeks.ago) }

  scenario "user can see events" do
    visit root_path

    expect(page).to have_selector("[data-test=upcoming-event]", count: 2)
    upcoming_events.each do |event|
      expect(page).to have_selector("[data-test=upcoming-event-name]", text: event.name)
      expect(page).to have_selector("[data-test=upcoming-event-link][href='#{event.event_url}']", text: "RSVP")
    end

    expect(page).to have_selector("[data-test=historic-event]", count: 2)
    historic_events.each do |event|
      expect(page).to have_selector("[data-test=historic-event-name]", text: event.name)
      expect(page).to have_selector("[data-test=historic-event-link][href='#{event.event_url}']", text: "Details & Slides")
    end
  end
end
