Rails.application.routes.draw do
    devise_for :users

    resources :servers
    root 'servers#index'
end
