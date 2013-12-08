class EventsController < ApplicationController

  def index
    @upcoming_events = Event.where("time >= ?", Time.now)
    @historic_events = Event.where("time < ?" , Time.now).limit(5)
  end

  def show
    @event = Event.find(params[:id])
    @rsvp = 'RSVP'
    if @event.time < Time.now
      @rsvp = 'Details & Slides'
    end

  end

end
