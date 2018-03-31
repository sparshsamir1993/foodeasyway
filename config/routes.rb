Rails.application.routes.draw do
  
  resources :addresses
  resources :restaurant_owners
  get 'admin/dashboard'

  resources :delivery_locations
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" },skip: ["devise_token_auth/concerns"], via: [:get, :post]
  resources :order_restaurants do
      member do
        post  :user_order_confirm
      end
  end
  resources :restaurants
  resources :items
  resources :orders
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
  namespace :api, defaults: { format: :json }, path: '/api' do
    namespace :v1, defaults: { format: :json }, path: '/v1' do
        # resources :users, only: [:index, :show]
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], via: [:get, :post]
        
        post '/auth/authenticatFacebookToken' => 'users#authenticatFacebookToken', as: :fbtokenauth
        resources :addresses, only: [:index, :create, :show, :update, :destroy]
        resources :restaurants, only: [:index, :create, :show, :update, :destroy]
        resources :orders, only: [:index, :create, :show, :update, :destroy]
        get "order_items/:order_id" => "order_items#index"
        resources :order_items, only: [:create, :show, :update, :destroy]
        resources :users do
            member do
                get :order_history
            end
        end
        
        resources :order_restaurants do
            member do
              post  :user_order_confirm
            end
        end
        namespace :restaurant_interface do
            mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
            resources :restaurant_owners do
                member do
                    post :save_location
                end
            end
            
            post '/auth/authenticatFacebookToken' => 'users#authenticatFacebookToken', as: :fbtokenauth
            resources :order_restaurants do
                member do
                    post :change_order_status
                end
            end
            resources :orders
            resources :users, only:[:index, :show]
        end
        
        
        
    end
  end
  root to: 'visitors#index'


end
