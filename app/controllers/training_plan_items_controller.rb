class TrainingPlanItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:mark_finished, :mark_unfinished]

  def mark_finished
    TrainingPlanItem.find_by(id: params[:training_item_id]).update_attributes(finished: true, date: Time.now)

    perform_redirect #todo: in the future use react to handle front end changes instead of redirects
  end

  def mark_unfinished
    TrainingPlanItem.find_by(id: params[:training_item_id]).update_attributes(finished: false, date: nil)

    perform_redirect
  end

  def perform_redirect
    redirect_to training_plans_path
  end

  def index
  end

  def edit

  end

  def new

  end

  def update

  end

  def destroy
    @item = TrainingPlanItem.find(params[:id])
    require 'pry'
    binding.pry

    @item.destroy
    training_plan_id= request.referrer.split('/').last
    redirect_to training_plan_path(training_plan_id)
  end
end