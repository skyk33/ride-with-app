class EventsController < ApplicationController
  def index
    @events = Event.includes(:user).order('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :date,
      :meetup_time,
      :prefecture_id,
      :meeting_point,
      :details
    ).merge(user_id: current_user.id)
  end
end
