# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart
  
    def create
      @product = Product.find(params[:product_id])
      @cart_item = @cart.cart_items.find_or_initialize_by(product: @product)
      @cart_item.quantity ||= 0
      @cart_item.quantity += 1
  
      if @cart_item.save
        flash[:success] = 'Produit ajouté au panier avec succès'
      else
        flash[:alert] = 'Impossible d\'ajouter le produit au panier'
      end
      redirect_to products_path
    end
  
    def update
      @cart_item = @cart.cart_items.find(params[:id])
  
      if @cart_item.update(cart_item_params)
        flash[:success] = 'Quantité mise à jour avec succès'
      else
        flash[:alert] = 'Impossible de mettre à jour la quantité'
      end
      redirect_to cart_path
    end
  
    def destroy
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.destroy
      flash[:success] = 'Produit supprimé du panier avec succès'
      redirect_to cart_path
    end
  
    private
  
    def set_cart
      @cart = current_user.cart || current_user.create_cart
    end
  
    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
  end
  