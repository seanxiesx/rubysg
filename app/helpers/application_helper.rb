module ApplicationHelper

  def event_link_name type
    output = 'Details & Slides'
    if type == 'upcoming'
      output = 'RSVP'
    end

    output
  end
end
