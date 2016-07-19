class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :product, index: true
      t.references :user
      t.string :description
      t.timestamps
    end
  end
end
