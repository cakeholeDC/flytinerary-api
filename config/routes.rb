Rails.application.routes.draw do
  resources :categories
  resources :traveler_events
  resources :traveler_trips
  resources :events
  resources :trips
  resources :travelers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/travelers/:id/trips', to: 'travelers#trips'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/resolve', to: 'auth#resolveToken'
    end
  end
end
