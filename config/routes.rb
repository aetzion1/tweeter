Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create] do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]
  get '/dashboard', to: 'dashboard#index'
  get '/explore', to: 'explore#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
