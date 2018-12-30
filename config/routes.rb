Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/user/auth/facebook'
	resources :products
  root 'products#index'
  resources :carts do
    member do
      post :pay
    end
  end
  resources :products do
    member do
      get :add_to_cart
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
