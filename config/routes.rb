Rails.application.routes.draw do
  resources :loans
  resources :books
  resources :authors
  devise_for :users
  resources :users, only: %i[ update ]
  get 'profile', to: "users#edit"
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
