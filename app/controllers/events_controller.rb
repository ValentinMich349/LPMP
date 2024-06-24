class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
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
      @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Événement créé avec succès.'
    else
      render :new
    end
    end
  
    def edit
    end
  
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:name, :description, :price, :start, :end, :city_id)
    end
  end
  