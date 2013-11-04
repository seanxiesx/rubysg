require "feature_spec_helper"

feature "RubySG Home Page" do
  scenario "user can see events" do
    visit root_path

    page.should have_selector("h1", text: "RubySG")
  end
end
