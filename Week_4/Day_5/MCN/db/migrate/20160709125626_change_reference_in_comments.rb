class ChangeReferenceInComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :concerts, index: true
  end
end
