Rails.application.routes.draw do

  root :to => 'posts#index'

  resources :posts, only: [:new, :create, :update, :destroy, :edit]
  devise_for :users
  resources :users, only: [:show] do
    resources :answers, only: [:create, :update, :destroy, :edit]
  end
  resources :profiles
end
