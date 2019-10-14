Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to:'sessions#new'
  delete '/logout', to:'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:create, :destroy]

  namespace :admin do

    resources :static_pages do
      member do
        get 'admin_page'
      end
    end

    resources :users
    resources :categories do
      resources :words
    end

  end
  
end

