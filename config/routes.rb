Rails.application.routes.draw do
  resource :wishlist, only: [:show]
  resources :wishlist_items, only: [:create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :edit, :update]
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :cancellations, only: [:index]
  resources :reviews, only: [:index]
  resource :cart, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :orders, only: [:new, :create, :index]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  root 'home#index'
  

  # Defines the root path route ("/")
  # root "posts#index"

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'


end
