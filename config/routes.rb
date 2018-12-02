Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#index'
  get 'signup_path', to:'users#new'
  post '/signup_path', to: 'users#create'
  post '/rooms_path', to: 'rooms#create'
  get '/rooms/index', to: 'rooms#index'
  post 'join_path', to: 'room_users#new'
  resources :users
  resources :rooms
  mount ActionCable.server => '/cable'
end
