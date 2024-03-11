class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    if Event.exists?(params[:id])
      @event = Event.find(params[:id])
      render :show
    else
      render 'errors/event_not_found', status: :not_found
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event.destroy
      redirect_to events_path, notice: 'Event was successfully deleted.'
    else
      redirect_to events_path, alert: 'Event can not destroyed.'
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
end
