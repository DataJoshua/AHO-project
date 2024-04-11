require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root "regions#index"

  authenticate :user, ->(u) { u.has_role?(:admin) } do
    resource :dashboard, only: %i[show], module: :admin

    resources :posts, only: %i[], module: :posts do
      resource :approve, only: %i[create]
      resource :reject, only: %i[create]
    end

    mount Sidekiq::Web => "/sidekiq"
  end

  authenticate :user, ->(u) { u.has_role?(:user) } do
    resource :dashboard, only: %i[show], module: :users

    resources :posts, only: %i[], module: :posts do
      resource :send_review, only: %i[create]
    end
  end

  resources :regions, only: %i[index show] do
    resources :posts, only: %i[create new edit update], module: :regions
  end

  namespace :turbo do
    resources :posts, only: %i[index]
  end

  resources :posts, only: %i[index show destroy]
end
