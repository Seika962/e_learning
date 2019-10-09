Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to:'sessions#new'
  delete '/logout', to:'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:create, :destroy]
end
