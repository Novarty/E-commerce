Rails.application.routes.draw do
  default_url_options :host => "localhost:3000/"
  devise_for :managers
  devise_for :users

  namespace :managers do
    resources :products
  end
  namespace :users do
    resources :products, only: [:index,:show]
  end
  authenticated :manager do
    root "managers/products#index", as: :manager_root
  end

  authenticated :user do
    root "users/products#index", as: :user_root
  end
  root "users/products#index"
end
