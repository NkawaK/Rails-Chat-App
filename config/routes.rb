Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#index'
  get 'signup_path', to:'users#new'
  post '/signup_path', to: 'users#create'
  resources :users
end
