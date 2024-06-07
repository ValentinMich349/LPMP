class WishlistItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wishlist = current_user.wishlist || current_user.create_wishlist
    @product = Product.find(params[:product_id])
    @wishlist.wishlist_items.create(product: @product)
    redirect_to @wishlist
  end

  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    redirect_to @wishlist_item.wishlist
  end
end