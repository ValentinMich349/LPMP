Rails.application.routes.draw do
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root 'home#index'
end
