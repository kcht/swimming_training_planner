Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'trainings#index'

  resources :users

  resources :trainings
  resources :training_plans, :training_plan_items

  post 'training_plan/:training_id', to: 'training_plans#add_training', as: 'add_training'
end
