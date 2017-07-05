class TrainingsController < ApplicationController
  include TrainingsHelper

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    require 'pry'

    @training = Training.new(append_database_field_before_create(training_params)) #append total_distance
    binding.pry

    if @training.save!
      redirect_to @training
    else
      render 'new'
    end
  end

  def destroy

  end

  private

  def training_params
    params.require(:training).permit(:title, :content, :created_by)
  end
end