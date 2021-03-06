Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :lists do
    resources :items
  end

  namespace :api, defaults: { format: :json } do
    resources :users
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
