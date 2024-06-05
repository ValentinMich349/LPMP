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
  
      # Vider le panier de l'utilisateur
      current_user.cart.cart_items.destroy_all
  
      # Afficher la vue de succès
    end
  
    def cancel
    end
  end
  