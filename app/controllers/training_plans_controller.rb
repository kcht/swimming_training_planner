class TrainingPlansController < ApplicationController
  include UsersHelper

  def show

    @items = TrainingPlanItem.where(training_plan_id: params[:id])
  end

  def add_training
    users_training_plan = users_training_plan(current_user.id)
    users_training_plan.training_plan_items.create(training_id: params[:training_id])
  end
end