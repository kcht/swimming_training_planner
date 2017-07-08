class TrainingPlansController < ApplicationController
  include UsersHelper
  
  before_action :redirect_to_login_if_not_authenticated

  def index
    @training_plans = TrainingPlan.where(user_id: current_user.id)
  end

  def show
    @training_plan = TrainingPlan.where(id: params[:id]).first
    @items = TrainingPlanItem.where(training_plan_id: params[:id])
  end

  def add_training
    users_training_plan = users_training_plan(current_user.id)
    users_training_plan.training_plan_items.create(training_id: params[:training_id])
  end

  def redirect_to_login_if_not_authenticated
    redirect_to new_user_session_path unless current_user
    # todo don't let other users see training plans that are not their own
  end
end