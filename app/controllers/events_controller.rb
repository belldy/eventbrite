class EventsController < ApplicationController

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
    @event = Event.new(title: params[:title],
                       description: params[:description],
                       start_date: params[:start_date],
                       duration: params[:duration],
                       price: params[:price],
                       location: params[:location])

    if @event.save
  	  flash[:success] = "Your event is created"
  	  redirect_to event_path(@event.id)
    end
  end

end
