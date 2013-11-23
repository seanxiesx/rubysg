namespace :meetup do
  desc "Import Upcoming Events"
  task :upcoming => :environment do
    Event.import_meetup_events(:upcoming)
  end

  desc "Import Historic Events"
  task :historic => :environment do
    Event.import_meetup_events(:historic)
  end
end
