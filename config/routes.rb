Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :services

  get 'services/manage'
end
