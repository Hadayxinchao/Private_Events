class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Event.exists?(params[:event_id])
      event = Event.find(params[:event_id])
      event.attendees << current_user
      redirect_to event_path(event)
    else
      render 'errors/event_not_found', status: :not_found
    end
  end

  private
  
  def join_event_params
    params.require(:event_attendees).permit(:event_id)
  end
end
