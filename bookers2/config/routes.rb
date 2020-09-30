Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'home/about', to: 'homes#about'
  root 'homes#top'
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
end
