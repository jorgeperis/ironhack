class AddReferenceColumnToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :movie, index: true
  end
end
