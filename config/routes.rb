Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :lists do
    resources :items
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists, only: [:index]
    end

    resources :lists do
      resources :items
    end

    resources :items, only: [:destroy]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end

# api/users
# api/users/:id
# api/users/:user_id/lists
# api/users/:user_id/lists/:id
# api/lists
# api/lists/:id
# api/lists/:list_id/items
# api/lists/:list_id/items/:id
# DELETE api/items/:id
