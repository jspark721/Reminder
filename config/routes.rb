Rails.application.routes.draw do
  get 'list/create'

  devise_for :users
  resources :users, only: [:show] do
    resources :lists
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
