class TrainingPlan < ApplicationRecord
  belongs_to :user
  has_many :training_plan_items
  has_many :trainings, through: :TrainingPlanItem
end
