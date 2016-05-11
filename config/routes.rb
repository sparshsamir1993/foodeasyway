Rails.application.routes.draw do
  
  devise_scope :user do
    root 'visitors#index'
    get 'users/index'
    get 'restaurant/index'
    get 'restaurant/show'
    get 'order/index' => 'order#index'
    get 'order/:restaurant_id/:id' => 'order#add'
    get 'order/clear' => 'order#clear'
    get 'admin/restaurant/new_item' => 'admin/restaurant#new_item'
    post 'admin/restaurant/new_item' => 'admin/restaurant#create_item'
    namespace :admin do
      resources :restaurant
      resources :items
    end
  end
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  end

  
end

