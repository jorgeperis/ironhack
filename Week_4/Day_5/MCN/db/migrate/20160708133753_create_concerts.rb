class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.references :comments, index: true
      t.string    :artist
      t.string    :venue
      t.string    :city
      t.datetime  :date
      t.integer   :price
      t.text      :description
      t.timestamps
    end
  end
end
