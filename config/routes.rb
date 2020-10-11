Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # 検索機能
  get 'items/search', to: 'items#search'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'namesearch'
    end
  end
  resources :users, only: [:show, :update] do
    resources :favorites, only: :index
  end
  resources :cards, only: [:new, :create]
end