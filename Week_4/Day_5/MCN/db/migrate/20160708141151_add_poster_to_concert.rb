class AddPosterToConcert < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :poster, :string
  end
end
