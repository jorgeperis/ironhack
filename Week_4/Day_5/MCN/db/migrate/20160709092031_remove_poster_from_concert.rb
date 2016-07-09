class RemovePosterFromConcert < ActiveRecord::Migration[5.0]
  def change
    remove_column :concerts, :poster, :string
  end
end
