Rails.application.routes.draw do
  
  devise_scope :user do
    root 'visitors#index'
    get 'restaurant/index'
    resources :user do
      get 'users/index'
     
      get 'restaurant/show'
      get 'order/index' 
      post 'order/index' => 'order#create'
      resources :restaurant do
        match 'order/thank_you' => 'order#send_message', via:[:get, :post]
      end
      post 'order' => 'order#clear'
      get 'admin/restaurant/new_item' => 'admin/restaurant#new_item'
      post 'admin/restaurant/new_item' => 'admin/restaurant#create_item'
      namespace :admin do
        resources :restaurant

        resources :items
      end
    end  
  end
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  end

  
end

