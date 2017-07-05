class TrainingsController < ApplicationController
  include TrainingsHelper

  before_action :check_privileges, only: [:edit, :destroy]

  def check_privileges
      redirect_to current_user unless can_be_deleted_by_user?(Training.find(params[:id]))
  end

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(append_database_field_before_create(training_params)) #append total_distance

    if @training.save!
      redirect_to @training
    else
      render 'new'
    end
  end

  def destroy
    training = Training.find(params[:id])
    training.destroy
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(:title, :content, :created_by)
  end
end