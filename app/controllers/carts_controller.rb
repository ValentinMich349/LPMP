class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :destroy]

  def show
    @top_liked_products = Product.order(rating: :desc).limit(4)
  end

  def destroy
    @cart.cart_items.destroy_all
    redirect_to cart_path, notice: 'Panier vidé avec succès.'
  end

  def update
    params[:quantities].each do |item_id, quantity|
      item = CartItem.find(item_id)
      item.update(quantity: quantity)
    end
    redirect_to cart_path, notice: 'Quantités mises à jour avec succès.'
  end

#  def apply_coupon
#     @cart = current_user.cart
#     coupon_code = params[:coupon_code]
#     coupon = Coupon.find_by(code: coupon_code)

#     if coupon && coupon.valid_for_cart?(@cart)
#       @cart.apply_coupon(coupon)
#       flash[:notice] = 'Coupon appliqué avec succès.'
#     else
#       flash[:alert] = 'Coupon invalide ou expiré.'
#     end

#     redirect_to cart_path
#   end
  
  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart!
  end
end
