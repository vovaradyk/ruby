Rails.application.routes.draw do
  root 'deliveries#index'

  root 'deliveries#index', as: @home

  resources :teams
  resources :companies
  resources :deliveries
  resources :cities
  resources :sponsors
  resources :players
end
