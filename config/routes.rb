Rails.application.routes.draw do
  resources :roles
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  post "/register", to: "users#create"
  resources :runs
  # API routes
  # namespace :api, defaults: { format: :json } do
  #   resources :runs
  # end

end
