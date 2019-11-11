Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook_login'

  delete '/logout' => 'sessions#destroy'


  resources :activations 
  resources :carriers
  resources :phones do
    resources :activations, shallow: true
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
