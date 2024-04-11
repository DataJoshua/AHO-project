Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "regions#index"

  authenticate :user, ->(u) { u.has_role?(:admin) } do
    resources :posts, only: %i[], module: :posts do
      resource :approve, only: %i[create]
      resource :reject, only: %i[create]
    end
  end

  resources :regions, only: %i[show] do
    resources :posts, only: %i[destroy create new edit update], module: :posts do
      resource :send_review, only: %i[create]
    end
  end

  resources :posts, only: %i[index show]
end
