Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :lists do
    resources :items
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
