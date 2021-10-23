Rails.application.routes.draw do
  resources :accounts
  get 'home/index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
  post "/receiver/:client" => 'receiver#handle_post'
end
