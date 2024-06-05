class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    # @cart est défini par le before_action
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
