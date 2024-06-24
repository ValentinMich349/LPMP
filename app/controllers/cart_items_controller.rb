class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @cart_item = @cart.cart_items.find_or_initialize_by(product: @product)
    elsif params[:event_id]
      @event = Event.find(params[:event_id])
      @cart_item = @cart.cart_items.find_or_initialize_by(event: @event)
    end

    @cart_item.quantity ||= 0
    @cart_item.quantity += params[:quantity].to_i

    if @cart_item.save
      redirect_to cart_path, notice: 'Article ajouté au panier.'
    else
      redirect_back fallback_location: root_path, alert: 'Erreur lors de l\'ajout au panier.'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: 'Panier mis à jour.'
    else
      redirect_to cart_path, alert: 'Erreur lors de la mise à jour du panier.'
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find_by(id: params[:id])
    if @cart_item
      @cart_item.quantity -= 1
      if @cart_item.quantity > 0
        @cart_item.save
      else
        @cart_item.destroy
      end
      flash[:success] = 'Produit supprimé du panier avec succès'
    else
      flash[:error] = 'Produit non trouvé dans le panier'
    end
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :event_id, :quantity)
  end
end
