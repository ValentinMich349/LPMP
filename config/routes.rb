Rails.application.routes.draw do
  devise_for :users do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root 'home#index'
  


  # Defines the root path route ("/")
  # root "posts#index"

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  
  resources :orders, only: [:index]
  resources :cancellations, only: [:index]
  resources :reviews, only: [:index]
  resource :profile, only: [:show]
end
