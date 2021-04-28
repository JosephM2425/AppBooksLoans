Rails.application.routes.draw do
  resources :my_loans, only: %i[ index show ]
  resources :loans
  resources :books
  resources :authors
  devise_for :users
  resources :users, only: %i[ update ]
  get 'profile', to: "users#edit"
  root 'static#index'
end
