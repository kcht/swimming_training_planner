class Training < ApplicationRecord
  has_many :training_plan_items
  has_many :training_plans, through: :training_plan_items
end
