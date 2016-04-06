Rails.application.routes.draw do
  get 'people/new'

  resources :households
  resources :people
  resources :vehicles

  
  devise_for :users
  
  root 'angular_form#index'
  get "angular_form", to: "angular_form#index"
end
