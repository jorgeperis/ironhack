class AddColumnToConcert < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :count_comments, :integer
  end
end
