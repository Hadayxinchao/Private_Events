class UsersController < ApplicationController

  def show  
    @my_events = Event.where(creator_id: current_user.id)
  end
end
