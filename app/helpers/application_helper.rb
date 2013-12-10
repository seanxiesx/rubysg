module ApplicationHelper
  def event_link_name(event)
    event.time >= Time.now ? 'RSVP' : 'Details & Slides'
  end
end
