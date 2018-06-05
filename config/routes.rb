Rails.application.routes.draw do

  #This (and the corresponding actions in the controllers and views) needs a real namespace refactor

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'static_pages#home'

  resources :users, only: [:index, :show] do
  	resources :friend_requests, only: [:create, :index, :destroy]
  	resources :friends, only: [:create, :index]
  end

  resources :friend_requests, only: [:destroy]
  resources :friends, only: [:destroy]

  resources :posts, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]
end
