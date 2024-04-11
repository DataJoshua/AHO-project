Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "regions#index"

  resources :regions, only: %i[show] do
    resources :posts, only: %i[destroy create new edit update]
  end
end
