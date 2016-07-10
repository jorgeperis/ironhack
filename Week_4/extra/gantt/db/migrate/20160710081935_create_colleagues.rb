class CreateColleagues < ActiveRecord::Migration[5.0]
  def change
    create_table :colleagues do |t|
      t.references :project, index: true
      t.string :name
      t.timestamps
    end
  end
end
