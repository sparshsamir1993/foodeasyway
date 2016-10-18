Rails.application.routes.draw do


  resources :delivery_locations
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
      resources :users
      resources :orders
  end
  root to: 'visitors#index'


end
