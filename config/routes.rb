Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  resources :items, only: [:index, :show]
  resources :wishlists
  resources :orders
  resources :line_items

  post 'order_items', to: 'orders#order_items', as: :order_order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
