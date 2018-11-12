Rails.application.routes.draw do
  root 'static_pages#index'
  get 'signup_path', to:'users#new'
  post '/signup_path', to: 'users#create'
  resources :users
end
