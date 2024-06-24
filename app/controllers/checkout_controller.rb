class CheckoutController < ApplicationController
    def create
      @total = params[:total].to_d
      @event_id = params[:event_id]
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            price_data: {
              currency: 'eur',
              unit_amount: (@total * 100).to_i,
              product_data: {
                name: 'Rails Stripe Checkout',
              },
            },
            quantity: 1
          }
        ],
        metadata: {
          event_id: @event_id
        },
        mode: 'payment',
        success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url
      )
      redirect_to @session.url, allow_other_host: true
    end
  
    def success
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      @event_id = @session.metadata.event_id
  
      @order = current_user.orders.build
      if @order.save
        current_user.cart.cart_items.each do |item|
          if item.product.present?
            @order.order_items.create!(
              product_id: item.product_id,
              quantity: item.quantity,
              price: item.product.price
            )
          elsif item.event.present?
            @order.order_items.create!(
              event_id: item.event_id,
              quantity: item.quantity,
              price: item.event.price
            )
          end
        end
        current_user.cart.cart_items.destroy_all
        redirect_to order_path(@order), notice: 'Votre commande a été passée avec succès.'
      else
        redirect_to cart_path, alert: 'Erreur lors de la création de la commande.'
      end
    end
  
    def cancel
    end

  end
  