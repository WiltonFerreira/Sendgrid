require 'sidekiq/web'

Rails.application.routes.draw do
  get 'events/index'
  mount Sidekiq::Web => '/sidekiq'

  resources :accounts
  get 'home/index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'events#index'
  post "/receiver/:client" => 'receiver#handle_post'
end
