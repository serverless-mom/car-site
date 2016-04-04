Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'
  get "angular_test", to: "angular_test#index"
end
