class WishlistsController < ApplicationController
  def show
    @wishlist = current_user.wishlist || current_user.create_wishlist
  end
end
