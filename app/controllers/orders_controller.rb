class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:new, :create]
  
    def new
      # Affiche le formulaire de validation de commande
    end
  
    def create
      @order = current_user.orders.build
      @cart.cart_items.each do |cart_item|
        @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
      end
  
      if @order.save
        @cart.cart_items.destroy_all
        flash[:success] = 'Commande passée avec succès'
        redirect_to root_path
      else
        flash[:alert] = 'Erreur lors de la validation de la commande'
        render :new
      end
    end
  
    private
  
    def set_cart
      @cart = current_user.cart || current_user.create_cart
    end
  end
  