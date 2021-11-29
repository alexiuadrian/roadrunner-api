Rails.application.routes.draw do

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  # API routes
  namespace :api, defaults: { format: :json } do
    resources :runs
  end

end
