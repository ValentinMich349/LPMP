Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root 'home#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
