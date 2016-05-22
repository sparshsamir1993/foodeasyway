Rails.application.routes.draw do
  
  devise_scope :user do
    root 'visitors#index'
    get 'restaurant/index'
    resources :user do
      get 'restaurant/show'
      get 'order/index'
      resources :users do 
        resources :restaurant do
          post 'order/index' => 'order#create'
          post 'order/index' => 'users#create'
          match 'order/index' => 'order#send_message', via:[:get, :post]
        end
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
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  end

  
end

