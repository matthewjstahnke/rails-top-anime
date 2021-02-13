Rails.application.routes.draw do
  root(to: "static#home")

  resources :animes do
    resources :reviews
  end 

  resources :users, only: [:new,:create]

  get "/logout", to: "sessions#logout", as: "logout"
  get "/signup", to: "sessions#signup", as: "signup"
  post "/signup", to: "sessions#create"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
end
