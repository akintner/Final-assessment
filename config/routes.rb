Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: "sessions#new"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :links, only: [:index, :new, :create, :edit, :update]

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  # resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :new, :create, :update]
      get '/toplinks', to: 'links#top_ten'
    end
  end
end
