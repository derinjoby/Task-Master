Rails.application.routes.draw do
  devise_for :users
  


  
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Root path
  root "tasks#index"

 
  resources :tasks do
    get 'show_articles', on: :collection
  end

  get '/auth/google_oauth2/callback', to: 'sessions#google_auth'

  get '/favicon.ico', to: redirect('/path/to/your/favicon.ico')


  


  # Render dynamic PWA files from app/views/pwa/*
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

