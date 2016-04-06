Rails.application.routes.draw do
  get 'people/new'

  resources :households do
    resources :people do
      resources :vehicles
    end
  end
  
  devise_for :users
  
  root 'angular_form#index'
  get "angular_form", to: "angular_form#index"
end
