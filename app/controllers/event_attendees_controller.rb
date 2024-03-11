class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Event.exists?(params[:event_id])
      event = Event.find(params[:event_id])
      if event.attendees.exists?(current_user.id)
        redirect_to event_path(event)
      else
        event.attendees << current_user
        redirect_to event_path(event)
      end
    
    else
      render 'errors/event_not_found', status: :not_found
    end
  end

  def destroy
    @event_attendee = current_user.event_attendees.find_by(event_id: params[:event_id])
    if @attendance.destroy
      redirect_to event_path(params[:event_id]), notice: 'Successfully removed yourself from the event.'
    else
      redirect_to event_path(params[:event_id]), alert: 'Failed to remove yourself from the event.'
    end
  end

  private
  
  def join_event_params
    params.require(:event_attendees).permit(:event_id)
  end
end
