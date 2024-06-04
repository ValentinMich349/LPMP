Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root 'home#index'
end
