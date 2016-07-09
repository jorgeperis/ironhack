class AddReferrenceToCommens < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :concert, index: true
  end
end
