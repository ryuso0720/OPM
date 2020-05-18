Rails.application.routes.draw do
  devise_for :users
  root to: 'page#home'
  root "posts#index"
  resources :posts do
  end

  namespace :api do
    resources :posts, only: :show
  end

  resources :users, only: :index
  get 'users/:name', controller: 'users', action: 'show'
end
