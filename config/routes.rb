Rails.application.routes.draw do
  resources :categories, only: [:index]
  # resources :user_trips
  resources :events, only: [:show, :create, :update]
  resources :trips, only: [:show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id/trips', to: 'users#trips'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/resolve', to: 'auth#resolveToken'
    end
  end
end
