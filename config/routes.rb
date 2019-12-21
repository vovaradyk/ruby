Rails.application.routes.draw do
  root 'teams#index'

  root 'teams#index', as: @home

  resources :teams
  resources :cities
  resources :sponsors
  resources :players
end
