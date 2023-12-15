# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end
