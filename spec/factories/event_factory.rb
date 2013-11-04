FactoryGirl.define do
  factory :event do
    title       { Forgery(:lorem_ipsum).words(5) }
    description { Forgery(:lorem_ipsum).paragraph }
    from        2.weeks.from_now
    to          2.weeks.from_now + 2.hours
    venue       { Forgery(:address).street_name }
    rsvp_link   { Forgery(:internet).domain_name }
  end
end
