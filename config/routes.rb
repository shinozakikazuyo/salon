Rails.application.routes.draw do
    
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
  # resources :users, except: [:index, :edit, :update, :destroy]
    member do
      get :favorites
      # /users/3/likes
      get :likes
    end
    collection do
      # /users/likes
      # get :likes
    end
  end
  
  resources :recipes, only: [:index, :show]
  resources :notices, only: [:show]
  resources :comments, only: [:create, :destroy, :index]
  resources :favorites, only: [:create, :destroy]
  
  #namespace :admin do
  #  resources :comments
  #end
  
end
