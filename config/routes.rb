Rails.application.routes.draw do

  devise_for :managers
  devise_for :users

  namespace :managers do
    resources :products
    root 'products#index'
  end
  namespace :users do
    resources :products, only: [:index,:show]
    root 'products#index'
  end
  authenticated :manager do
    root "managers/products#index", as: :manager_root
  end

  authenticated :user do
    root "users/products#index", as: :user_root
  end
  root "users/products#index"
end
