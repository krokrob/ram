Rails.application.routes.draw do
  devise_for :users
  root to: 'memories#index'
  resources :memories, only: [ :index, :show, :new, :create]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :memories, only: :index
    end
  end
end
