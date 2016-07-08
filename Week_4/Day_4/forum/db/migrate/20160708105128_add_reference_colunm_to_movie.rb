class AddReferenceColunmToMovie < ActiveRecord::Migration[5.0]
  def change
    add_reference :movies, :comments, index: true
  end
end
