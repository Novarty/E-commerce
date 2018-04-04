Rails.application.routes.draw do
  default_url_options host: 'localhost:3000/'
  devise_for :managers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :managers do
    resources :products
    resources :orders
    resources :profiles, only: :show
  end
  namespace :users do
    resources :products, only: %i[index show]
    resources :cart_products, only: %i[index new destroy]
    resource :cart, only: :destroy
    resources :orders, only: %i[new show create index]
    resources :profiles, only: :show
    root 'products#index'
  end
  authenticated :manager do
    root 'managers/products#index', as: :manager_root
  end

  authenticated :user do
    root 'users/products#index', as: :user_root
  end
  root 'users/products#index'
end
