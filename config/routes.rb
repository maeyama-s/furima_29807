Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # 検索機能
  get 'items/search', to: 'items#search'
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end