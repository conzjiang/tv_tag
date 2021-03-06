Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :tv_shows, only: [:index, :create, :update]
    resources :tags, only: :create
  end
end
