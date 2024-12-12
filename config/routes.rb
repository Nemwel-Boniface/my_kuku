Rails.application.routes.draw do
  resources :chickens
  resources :eggs, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :dashboards
  resources :comments
  resources :blogs
  devise_for :users
  resources :contacts
  resources :abouts
  resources :homes
  resources :sales, only: [:new, :create, :show] do
    collection do
      get :buy
    end
  end
  post 'sales/confirm', to: 'sales#confirm', as: 'confirm_sale'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
end
