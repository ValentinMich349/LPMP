class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_order

    def current_order
      if session[:order_id]
        Order.find(session[:order_id])
      else
        order = Order.create(status: "cart")
        session[:order_id] = order.id
        order
      end
    end
  

    protected
  
    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo])
    end

   
end

