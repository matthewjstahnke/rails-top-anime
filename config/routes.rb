Rails.application.routes.draw do
  root(to: "static#home")

  resources :users, only: [:new,:create]

  get "/logout", to: "sessions#logout", as: "logout"
  get "/signup", to: "sessions#signup", as: "signup"
  post "/signup", to: "sessions#create"
end
