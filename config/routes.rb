Rails.application.routes.draw do
  
  
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    root 'visitors#index'
    get 'restaurant/index'
  end
    resources :users do

      get 'restaurant/show'
      get 'order/index'
      patch 'order/index' => 'users#create'
      resources :restaurant do
        get 'items/index'
        post 'order/index' => 'order#create'
          
        match 'order/index' => 'order#send_message', via:[:get, :post]
      end

      post 'order/index' => 'order#clear'
    end
    
    get 'admin/restaurant/new_item' => 'admin/restaurant#new_item'
    post 'admin/restaurant/new_item' => 'admin/restaurant#create_item'
    get 'admin/items' => 'admin/items#edit'
    post 'admin/items' => 'admin/items#update'
    namespace :admin do
        resources :restaurant do
          patch 'edit'
        end
        resources :items
    end
  
  

  
end

