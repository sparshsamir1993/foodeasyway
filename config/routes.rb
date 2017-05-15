Rails.application.routes.draw do
  resources :order_restaurants do
      member do
          post :confirm
      end
  end
  resources :restaurant_owners
  get 'admin/dashboard'

  resources :delivery_locations
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, skip: ["devise_token_auth/concerns"]
  resources :orders do
      member do
        post  :send_message
      end
  end
  resources :restaurants
  resources :items
  resources :order_items
  resources :users do
      member do
          post :update_contact
      end
  end
  namespace :admin do
      resources :restaurants
      resources :items
      resources :restaurant_owners
      resources :users
      resources :orders
  end
  namespace :restaurant_interface do
      resources :orders
  end
  namespace :api do
    namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
        resources :restaurants, only: [:index, :create, :show, :update, :destroy]
        resources :orders, only: [:index, :create, :show, :update, :destroy]
        resources :order_items, only: [:index, :create, :show, :update, :destroy]
        resources :users, only:[:index, :show]
    end
  end
  root to: 'visitors#index'


end
