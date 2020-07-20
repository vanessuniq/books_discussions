Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: "users#new"
  root 'static_pages#home'
  get '/home', to: "static_pages#home"
  resources :users
  resources :books, only: [:show, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
