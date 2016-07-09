class DeleteReferencesFromConcert < ActiveRecord::Migration[5.0]
  def change
    remove_reference :concerts, :comments, index: true
  end
end
