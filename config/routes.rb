Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get "/avatars/original/missing.png", to: "application#no_attachments"

  resources :users, only: [:index, :create, :update, :destroy]
  resources :posts, only: [:index, :create, :update, :destroy]
end
