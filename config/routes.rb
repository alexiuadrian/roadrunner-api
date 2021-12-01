Rails.application.routes.draw do
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  post "/register", to: "users#create"
  resources :users

  # API routes
  namespace :api, defaults: { format: :json } do
    resources :runs
    get "/report", to: "runs#report"
  end

end
