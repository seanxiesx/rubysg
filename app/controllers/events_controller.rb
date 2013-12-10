class EventsController < ApplicationController

  def index
    @upcoming_events = Event.upcoming
    @historic_events = Event.historic.limit(5)
  end

  def show
    @event = Event.find(params[:id])
  end
end
