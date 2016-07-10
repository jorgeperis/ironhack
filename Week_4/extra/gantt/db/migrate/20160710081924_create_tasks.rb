class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :project, index: true
      t.references :colleague, index: true
      t.string :name
      t.date :start
      t.date :finish
      t.timestamps
    end
  end
end
