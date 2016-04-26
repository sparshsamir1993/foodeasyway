Rails.application.routes.draw do
  
  devise_scope :user do
    root to: 'visitors#index'
    get 'users/index'
    get 'restaurant/index'
    get 'restaurant/show'
    namespace :admin do
      resources :restaurant
    end
  end
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  end

  
end
