Rails.application.routes.draw do

  root 'pages#start'

  resources :users, only: [:create] do
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

  match '/signup', to: "users#new", :as => "signup", via: :get
  match '/signout', to: "sessions#destroy", :as => "signout", via: :get
  match '/signin', to: "sessions#new", :as => "signin", via: :get


  resources :actuators
  resources :sensors
  resources :sessions, only: [:new, :create, :destroy] 



end
