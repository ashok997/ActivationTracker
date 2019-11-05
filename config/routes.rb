Rails.application.routes.draw do
  resources :activations
  resources :carriers
  resources :phones
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
