Rails.application.routes.draw do
  root 'static_pages#index'
  get 'signup_path', to:'users#new'
  resources :users
end
