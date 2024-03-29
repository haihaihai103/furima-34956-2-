Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  resources :items do
    resources :customers, only: [:index, :create]
    get :search, on: :collection
    resources :comments, only: :create
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end
