class WishlistsController < ApplicationController

  before_action :authenticate_user!

  def show
    @wishlist = current_user.wishlist || current_user.create_wishlist
  end
end
