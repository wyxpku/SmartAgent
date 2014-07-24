Rails.application.routes.draw do

  resources :actuators

  resources :sensors

  root 'pages#start'

  resources :users do
    resources :apps
  end

  get '/pages/index', to: 'pages#index' #as: 'pages_index'
  get '/pages/myapps', to: 'pages#myapps'
  get '/pages/resources', to: 'pages#resources'
  get '/pages/createapp', to: 'pages#createapp'
  get '/pages/location', to: 'pages#location'
  get '/pages/apps', to: 'pages#viewapps'
  get '/pages/developer', to: 'pages#developer'
  get '/pages/myaccount', to: 'pages#myacount'




  resources :sessions
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"
  get 'log_out' => "sessions#destroy", :as => "log_out"


end
