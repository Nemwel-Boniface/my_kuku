Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  resources :contacts
  resources :abouts
  resources :homes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
end
