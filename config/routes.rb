Rails.application.routes.draw do
    devise_for :users

    resources :servers
    resources :users, only: [:show, :index]
    root 'servers#index'
end
