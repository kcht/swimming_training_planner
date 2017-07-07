module TrainingPlanItemsHelper
  def training_plan_item_status(item)
    return 'nil' unless item
    return item.finished ? 'Planned' : 'Finished'
  end
end