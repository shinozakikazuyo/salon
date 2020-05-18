Rails.application.routes.draw do
    
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :favorites
    end
  end
  
  resources :recipes, only: [:index, :show]
  resources :notices, only: [:show]
  resources :comments, only: [:create, :destroy, :index]
  resources :favorites, only: [:create, :destroy]
  
end
