Rails.application.routes.draw do
  root 'secrets#index'
  resources :secrets
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
