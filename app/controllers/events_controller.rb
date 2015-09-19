class EventsController < ApplicationController
  before_action :find_event_by_id, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @events = Event.all;
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params);
    event.save;
    redirect_to events_path;
  end

  def edit
  end

  def update
    @event.update(event_params);
    redirect_to event_path(@event);
  end

  def delete
  end

  def destroy
    @event.destroy;
    redirect_to root_path;
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :start, :finish, :location);
  end

  def find_event_by_id
    @event = Event.find(params[:id]);
  end
end
