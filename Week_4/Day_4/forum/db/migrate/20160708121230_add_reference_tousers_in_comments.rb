class AddReferenceTousersInComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, index: true
    remove_column :comments, :user
  end
end
