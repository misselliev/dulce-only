# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts, except: [:destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'posts#index'
end
