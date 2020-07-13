Rails.application.routes.draw do
  get 'signup', to: "users#new"
  root 'static_pages#home'
  get '/home', to: "static_pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
