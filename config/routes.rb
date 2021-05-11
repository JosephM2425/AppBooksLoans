Rails.application.routes.draw do
  get 'home/landing'
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

  root 'static#index'
end
