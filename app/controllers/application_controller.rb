class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_order
    before_action :load_categories
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from StandardError, with: :render_500


    def current_order
      if session[:order_id]
        Order.find(session[:order_id])
      else
        order = Order.create(status: "cart")
        session[:order_id] = order.id
        order
      end
    end

    unless Rails.application.config.consider_all_requests_local
      rescue_from ActionController::RoutingError, with: :render_404
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      rescue_from StandardError, with: :render_500
    end
  
    def routing_error
      raise ActionController::RoutingError, params[:path]
    end
  

    protected
  
    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo])
    end

    private
    
    def load_categories
      @categories = Category.all
    end

    
    def render_404(exception = nil)
      respond_to do |format|
        format.html { render template: 'errors/not_found', status: 404 }
        format.all { render nothing: true, status: 404 }
      end
    end
  
    def render_500(exception = nil)
      respond_to do |format|
        format.html { render template: 'errors/internal_server_error', status: 500 }
        format.all { render nothing: true, status: 500 }
      end
    end
   
end

