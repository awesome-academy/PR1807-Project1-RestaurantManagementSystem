Rails.application.routes.draw do
  root "static_pages#home"

  get "/contact", to: "static_pages#contact"
  get "/about",   to: "static_pages#about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: :index
  resources :dishes
  resources :reservations
  resources :reserved_dishes
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  namespace :admin do
    root "sessions#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :reservations
    resources :dishes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
