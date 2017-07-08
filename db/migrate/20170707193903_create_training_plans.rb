class CreateTrainingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :training_plans do |t|
      t.integer :user_id, null: false, references: [:users, :id]
      t.string :name

      t.timestamps
    end
  end
end
