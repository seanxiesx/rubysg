class Meetup
  include HTTParty
  base_uri "api.meetup.com"

  GROUP_ID = 3952812

  def events(options)
    response = self.class.get( "/2/events", query: required_options.merge!(options) )
    response["results"]
  end

  def upcoming_events
    events(status: "upcoming", page: 20)
  end

  def past_events
    events(status: "past", page: 20)
  end

  private

  def required_options
    { sign: "true", key: ENV["MEETUP_API_KEY"], group_id: GROUP_ID }
  end
end
