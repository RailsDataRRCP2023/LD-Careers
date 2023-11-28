Rails.application.routes.draw do
  resources :indices
  devise_for :customers
  devise_for :payments
  devise_for :order_items
  devise_for :payment_methods
  devise_for :orders
  devise_for :products
  devise_for :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Index is the root path
  resources :indices
  root "indices#index"

  # Resources
  resources :categories
  resources :products
  resources :orders
  resources :order_items
  resources :payments
  resources :payment_methods

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
