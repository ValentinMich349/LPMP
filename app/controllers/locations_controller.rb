class LocationsController < ApplicationController
  def index
    @shops = Store.all
    @events = Event.includes(:city).all

    @shops_data = @shops.map do |shop|
      {
        lon: shop.longitude,
        lat: shop.latitude,
        name: shop.name,
        address: shop.address,
        city: shop.city,
        state: shop.state,
        zip_code: shop.zip_code,
        phone_number: shop.phone_number,
        email: shop.email
      }
    end.to_json

    @events_data = @events.map do |event|
      {
        id: event.id,
        lon: event.city.longitude,
        lat: event.city.latitude,
        name: event.name,
        description: event.description,
        start: event.start,
        end: event.end,
        localisation: event.city.name
      }
    end.to_json
  end
end