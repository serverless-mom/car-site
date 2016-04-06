Rails.application.routes.draw do

  resources :households, :people, :vehicles, only: [:index, :show, :new, :create]
  
  devise_for :users
  
  root 'angular_form#index'
  get "angular_form", to: "angular_form#index"
end
