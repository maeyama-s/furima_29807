Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'items/:id/orders', to: "orders#index"
  resources :orders, only:[:create]
end