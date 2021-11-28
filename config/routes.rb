Rails.application.routes.draw do

  # API routes
  namespace :api, defaults: { format: :json } do
    resources :runs
  end

end
