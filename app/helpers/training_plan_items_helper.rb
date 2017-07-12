module TrainingPlanItemsHelper
  def training_plan_item_status(item)
    return 'nil' if item.finished.nil?
    return item.finished ? 'Finished' : 'Planned'
  end
end