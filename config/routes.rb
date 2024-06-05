Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :edit, :update]
  resources :products, only: [:index, :show]
  resource :cart, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :orders, only: [:new, :create, :index]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  root 'home#index'
  

  # Defines the root path route ("/")
  # root "posts#index"

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :cancellations, only: [:index]
  resources :reviews, only: [:index]
end
