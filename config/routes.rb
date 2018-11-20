Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :golfers
  resources :users

  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
