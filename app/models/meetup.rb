class Meetup
  include HTTParty
  base_uri "api.meetup.com"

  GROUP_ID = 3952812

  class << self
    def upcoming_events
      events(status: "upcoming")
    end

    def historic_events
      events(status: "past")
    end

    private

    def required_options
      { sign: "true", key: ENV["MEETUP_API_KEY"], group_id: GROUP_ID, page: 5, desc: "desc", fields: "event_hosts" }
    end

    def events(options)
      response = self.get( "/2/events", query: required_options.merge!(options) )
      response["results"]
    end
  end
end
