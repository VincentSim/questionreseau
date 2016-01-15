Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users, only: [:show] do
    resources :answers, only: [:create, :update, :destroy, :edit]
  end
  resources :profiles
end
