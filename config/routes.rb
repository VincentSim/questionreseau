Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :profiles
end
