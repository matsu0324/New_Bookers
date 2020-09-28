Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:new, :create, :index, :show]
end
