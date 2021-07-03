Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  resources :items do
    resources :customers, only: [:index, :create]
    get :search, on: :collection
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  #get 'items/search'
end
