Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :services
  resources :service_categories

  get 'services/manage'
end
