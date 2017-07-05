Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'trainings#index'

  resources :users

  resources :trainings

end
