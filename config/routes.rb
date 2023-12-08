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
  resources :products do
    post :add_to_cart, on: :member
    delete :remove_from_cart, on: :member
    put :update_quantity_cart, on: :member
    delete :clear_cart
  end
  resources :orders
  resources :order_items
  resources :payments
  resources :payment_methods
  resources :checkouts do
    get :index, to: "checkouts#index", as: :index
    post :create, to: "checkouts#create", as: :create
    get :success, to: "checkouts#success", as: :success
    get :cancel, to: "checkouts#cancel", as: :cancel
  end
  resources :customers
  resources :province_taxes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
