Rails.application.routes.draw do

  root :to => 'posts#index'

  resources :posts, only: [:new, :create, :show, :update, :destroy, :edit]
  devise_for :users
  resources :users, only: [:show] do
    resources :answers, only: [:create]
  end
  resources :answers, only: [:destroy]
  resources :profiles
end
