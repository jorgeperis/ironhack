class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :short
      t.string :original
      t.timestamps
    end
  end
end
