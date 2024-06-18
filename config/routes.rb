Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :products do
    member do
      post 'like'
    end
  end

  resources :users, only: [:show, :edit, :update]
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :cancellations, only: [:index]
  resources :reviews, only: [:index]
  resource :cart, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :orders, only: [:new, :create, :index]
  resources :categories, only: [:show, :index]
  resource :wishlist, only: [:show]
  resources :wishlist_items, only: [:create, :destroy]
  resources :events, only: [:index, :show, :new, :create]
  resources :locations, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  root 'home#index'
  

  # Defines the root path route ("/")
  # root "posts#index"
  get 'stores/map', to: 'stores#map'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'search', to: 'search#index'


end
