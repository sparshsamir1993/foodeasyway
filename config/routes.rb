Rails.application.routes.draw do


  resources :order_items
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :orders
  resources :restaurant
  resources :items
  resources :order_items
  resources :users
  root to: 'visitors#index'


end
