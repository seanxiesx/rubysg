require "feature_spec_helper"

feature "RubySG Event Page" do
  let!(:upcoming_events) { create_list(:event, 2, time: 2.weeks.from_now) }
  let!(:historic_events) { create_list(:event, 2, time: 2.weeks.ago) }

  scenario "user can see events" do

    upcoming_events.each do |event|
      visit event_path(event.id)

      expect(page).to have_selector("[itemprop=summary]", text: event.name)
      expect(page).to have_selector("[data-test=event-link][href='#{event.event_url}']", text: "RSVP")
      expect(page).to have_selector("[itemprop=startDate]", text: event.time.strftime("%B %e - %-l:%M%P"))
      expect(page).to have_selector("[itemprop=name]", text: event.venue_name)
      expect(page).to have_selector("[itemprop=street-address]", text: event.venue_address)
    end

    historic_events.each do |event|
      visit event_path(event.id)

      expect(page).to have_selector("[itemprop=summary]", text: event.name)
      expect(page).to have_selector("[data-test=event-link][href='#{event.event_url}']", text: "Details & Slides")
      expect(page).to have_selector("[itemprop=startDate]", text: event.time.strftime("%B %e - %-l:%M%P"))
      expect(page).to have_selector("[itemprop=name]", text: event.venue_name)
      expect(page).to have_selector("[itemprop=street-address]", text: event.venue_address)
    end
  end
end
