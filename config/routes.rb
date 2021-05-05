Rails.application.routes.draw do
  resources :my_loans, only: %i[ index show ]
  resources :loans

  resources :books
  get 'search', to: "books#search"

  #resources :books, except: %i[ new create edit update  ]
  


  resources :authors
  devise_for :users
  
  resources :users, only: %i[ index update ] do
    collection do
      patch 'change_theme', to: 'users#change_theme'
    end
  end

  get 'profile', to: 'users#edit'

  #authenticate :user, ->(u) { u.admin? } do
  #  resources :books, only: %i[ new create edit update ]
  #end

  root 'static#index'
end
