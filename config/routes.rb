Rails.application.routes.draw do
  devise_for :users

  # API routes
  namespace :api, defaults: {format: :json} do
    resources :runs
  end
  
end
