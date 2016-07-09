class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :concerts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :concerts, :avatar
  end
end
