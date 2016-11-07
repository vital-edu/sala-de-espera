Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'static_pages#home'

  resources :services
  resources :service_categories
  resources :employees
end
