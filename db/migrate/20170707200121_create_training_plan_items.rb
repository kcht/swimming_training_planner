class CreateTrainingPlanItems < ActiveRecord::Migration[5.1]
  def change
    create_table :training_plan_items do |t|
      t.integer :training_plan_id, references: [:training_plans]
      t.integer :training_id, references: [:trainings]
      t.date :date
      t.boolean :finished #false-planned true-finished

      t.timestamps
    end
  end
end
