Rails.application.routes.draw do
  
  resources :my_loans, only: %i[ index show ]
  resources :loans

  resources :books
  get 'search', to: "books#search"

  resources :authors
  devise_for :users
  
  resources :users, only: %i[ index update ] do
    collection do
      patch 'change_theme', to: 'users#change_theme'
    end
  end
  
  get 'profile', to: 'users#edit'

  devise_scope :user do
    authenticated :user do
      root 'static#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'home#landing', as: :unauthenticated_root
    end
  end
end
