Rails.application.routes.draw do
  resources :products
  devise_for :managers
  devise_for :users
  root to: 'products#index'
end
