ActiveAdmin.setup do |config|

  config.site_title = "Lpmp"

  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: 'Retour au site', url: '/', html_options: { target: :blank }
    end
  end

  config.authentication_method = :authenticate_user!

  config.current_user_method = :current_user


  config.logout_link_path = :destroy_user_session_path

   config.logout_link_method = :delete


  config.batch_actions = true


  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  config.localize_format = :long

end
