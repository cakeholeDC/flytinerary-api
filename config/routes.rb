Rails.application.routes.draw do
  resources :traveler_events
  resources :traveler_trips
  resources :events
  resources :trips
  resources :travelers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
    end
  end
end
