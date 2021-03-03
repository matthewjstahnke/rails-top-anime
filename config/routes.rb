Rails.application.routes.draw do
  root(to: "static#home")

  resources :animes do
    resources :reviews, except: [:index]
  end 

  resources :users, only: [:new,:create]

  get "/logout", to: "sessions#logout", as: "logout"
  get "/signup", to: "sessions#signup", as: "signup"
  post "/signup", to: "sessions#create"
 
  get "/egg" => "static#egg"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
  match '*path' => 'application#fallback', via: :all
end
