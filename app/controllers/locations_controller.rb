class LocationsController < ApplicationController
    def index
      @shops = Store.all
      @events = Event.includes(:city).all
    end
  end