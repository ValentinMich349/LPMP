class ApplicationController < ActionController::Base
     # permet d accepter le pseudo pour devise
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo])
    end

   
end
