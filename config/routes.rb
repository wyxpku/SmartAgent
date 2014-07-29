Rails.application.routes.draw do


  root 'pages#start'

  resources :actuators

  resources :sensors

  resources :users do
    resources :apps
  end

  get 'index', to: 'pages#index', as: 'index'
  get 'myapps', to: 'pages#myapps', as: 'myapps'
  get 'resources', to: 'pages#resources',as: 'resources'
  get 'createapp', to: 'pages#createapp', as: 'createapp'
  get 'location', to: 'pages#location', as: 'location'
  get 'apps', to: 'pages#viewapps', as: 'apps'
  get 'developer', to: 'pages#developer', as: 'developer'
  get 'myaccount', to: 'pages#myacount', as: 'myaccount'
  get 'query/sensors', to: 'sensors#queryAll'




  resources :sessions
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"
  get 'log_out' => "sessions#destroy", :as => "log_out"


end
