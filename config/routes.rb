Rails.application.routes.draw do
  root 'gatepasses#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :items
  resources :gatepasses
  resources :companies
  resources :gate_types
  resources :sections
  resources :nationals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
