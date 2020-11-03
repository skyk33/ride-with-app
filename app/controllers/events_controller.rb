class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit
    end
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

  def set_event
    @event = Event.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user.id != @event.user_id
  end
end
