Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: "users#new"
  root 'static_pages#home'
  get '/home', to: "static_pages#home"
  resources :users
  
  resources :books, only: [:show, :index, :destroy] do
    resources :discussions, only: [:new, :show, :index]
  end

  resources :discussions, only: [:index, :new, :show, :create, :destroy] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
