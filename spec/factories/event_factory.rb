FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "##{n} Meetup" }
    description   "<p>Description with HTML</p>"
    event_url     "http://meetup.com"
    time          { 2.weeks.from_now }
    venue_name    "Plugin @ Blk 71"
    venue_address "71 Ayer Rajah, Singapore 139951"
    venue_lon     103.786911
    venue_lat     1.296769
    meetup_id     1000
  end
end
