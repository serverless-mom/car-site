Rails.application.routes.draw do
  resources :people
  resources :households
  resources :vehicles
  
  devise_for :users
  
  root 'dashboard#index'
  get "angular_form", to: "angular_form#index"
end
