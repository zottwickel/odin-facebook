Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'static_pages#home'

  resources :users, only: [:index, :show] do
  	resources :friend_requests, only: [:index, :destroy]
  	resources :friends, only: [:create, :index]
  end
  resources :friend_requests, only: [:destroy]
  resources :friends, only: [:destroy]
end
