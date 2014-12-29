Rails.application.routes.draw do
    devise_for :users

    resources :unturned_servers
    resources :users, only: [:show, :index]
    root 'unturned_servers#index'
end
