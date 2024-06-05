class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :configure_account_update_params, only: [:update]

  protected

  # Permettre les paramètres personnalisés pour la mise à jour du compte
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :current_password, :password, :password_confirmation])
  end

  # Surcharge la méthode `update_resource` pour inclure la vérification du mot de passe actuel
  def update_resource(resource, params)
    if params[:password].blank?
      resource.update_without_password(params.except(:current_password))
    else
      current_password = params.delete(:current_password)

      if resource.valid_password?(current_password)
        resource.update(params)
      else
        resource.errors.add(:current_password, "n'est pas correct")
        false
      end
    end
  end
end
