class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    @historic_events = Event.historic.limit(5)
  end
end
