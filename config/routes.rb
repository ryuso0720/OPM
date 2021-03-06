Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index, :new, :create, :edit, :destroy, :update]
  namespace :api do
    resources :posts, only: :show
  end

  resources :articles, only: [:show, :new, :create, :edit, :destroy, :update] do
    resources :photos, only: :creste
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  namespace :api, format: 'json' do
    get 'articles/preview'
  end


  resources :users, only: :index do
    resources :personals, only: [:create, :new, :edit, :update]
  end
  get 'users/:name', controller: 'users', action: 'show'

end
