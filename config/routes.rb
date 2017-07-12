Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'trainings#index'

  resources :users

  resources :trainings
  resources :training_plans, :training_plan_items

  post 'training_plan/:training_id', to: 'training_plans#add_training', as: 'add_training'
  post 'training_plan_items/:training_item_id/mark_finished', to: 'training_plan_items#mark_finished', as: 'mark_finished'
  post 'training_plan_items/:training_item_id/mark_unfinished', to: 'training_plan_items#mark_unfinished', as: 'mark_unfinished'
end
