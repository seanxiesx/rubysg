require "feature_spec_helper"

feature "RubySG Home Page" do
  let!(:events) { create_list(:event, 2) }

  scenario "user can see events" do
    visit root_path

    page.should have_selector("[data-test=event]", count: 2)
    events.each do |event|
      page.should have_selector("[data-test=event-title]", text: event.title)
    end
  end
end
