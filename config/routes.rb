Rails.application.routes.draw do
  devise_for :users
  root to: 'memories#index'
  resources :memories, only: [ :index, :show, :new, :create]
end
