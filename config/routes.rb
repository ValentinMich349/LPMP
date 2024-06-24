Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :products do
    member do
      post 'like'
    end
  end

  ActiveAdmin.routes(self)


  resources :users, only: [:show, :edit, :update]
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :cancellations, only: [:index]
  resources :reviews, only: [:index]
  resource :cart, only: [:show, :destroy, :update] do
    post 'apply_coupon', on: :collection
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :products do
    resources :reviews, only: [:create, :edit, :update, :destroy, :index, :show]
  end
  resources :orders
  resources :categories, only: [:show, :index]
  resource :wishlist, only: [:show]
  resources :wishlist_items, only: [:create, :destroy]
  resources :events, only: [:index, :show, :new, :create, :edit]
  resources :locations, only: [:index]
  resources :delivery_addresses, except: [:show]
  resources :images, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  root 'home#index'
  match '/404', to: 'errors#not_found', via: :all

  

  # Defines the root path route ("/")
  # root "posts#index"
  get 'stores/map', to: 'stores#map'
  get '/about', to: 'static_pages#about'
  get 'search', to: 'search#index'
  get 'privacy_policy', to: 'static_pages#privacy_policy', as: 'privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service', as: 'terms_of_service'
  get 'faq', to: 'static_pages#faq', as: 'faq'
  get 'contact', to: 'static_pages#contact', as: 'contact'


end
