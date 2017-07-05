class AddCreatedByToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :created_by, :integer
  end
end
