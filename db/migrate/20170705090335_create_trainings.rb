class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :content
      t.integer :total_distance

      t.timestamps
    end
  end
end
