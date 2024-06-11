class HomeController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
    @upcoming_events = Event.where('start >= ?', Time.zone.now).order(:start).limit(6)
    @latest_products = Product.order(created_at: :desc).limit(4)
  end
end

