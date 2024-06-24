class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:new, :create]
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
    
    
  
    def new
    end

    def index
      @orders = Order.all
      @orders = current_user.orders.includes(:user)
    end
  
    def show
      @order_items = @order.order_items.includes(:product)
    end

  
    def create
      @order = current_user.orders.build
      @cart.cart_items.each do |cart_item|
        @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
      end
  
      if @order.save
        current_cart.cart_items.each do |item|
          @order.order_items.create!(
            product_id: item.product_id,
            quantity: item.quantity,
            price: item.product.price
          )
        end
        @cart.cart_items.destroy_all
        flash[:success] = 'Commande passée avec succès'
        redirect_to root_path
      else
        flash[:alert] = 'Erreur lors de la validation de la commande'
        render :new
      end
    end

    def edit
      @order = Order.find(params[:id])
    end

    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
        redirect_to @order
      else
        render 'edit'
      end
    end 

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      redirect_to orders_path
    end
  
    private
  
    def set_cart
      @cart = current_user.cart || current_user.create_cart
    end

    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to orders_path, alert: "Vous n'êtes pas autorisé à voir cette commande." if @order.nil?
    end

    def order_params
      params.require(:order).permit(order_items_attributes: [:product_id, :quantity, :price])
    end
    
    def order_params_adress
      params.require(:order).permit(:address_line1, :address_line2, :city, :state, :zip_code, :country)
    end
  end
  