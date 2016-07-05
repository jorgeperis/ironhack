class AddUseridToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :userid, :integer
  end
end
