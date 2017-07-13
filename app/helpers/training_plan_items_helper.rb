module TrainingPlanItemsHelper
  def training_plan_item_status(item)
    return 'nil' if item.finished.nil?
    return item.finished ? 'Finished' : 'Planned'
  end

  def total_distance_in_completed_trainings(training_items)
    training_items.select(&:finished).inject(0) { |sum, item| sum+ item.training.total_distance}
  end

  def total_number_of_completed_trainings(training_items)
    training_items.select(&:finished).count
  end
end